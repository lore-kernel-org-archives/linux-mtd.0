Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f40wp-0006tW-L2
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 09:12:49 +0000
Subject: Re: [PATCH 1/1] mtd:nand:fix memory leak
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Xidong Wang <wangxidong_97@163.com>, Mans Rullgard <mans@mansr.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
 <20180404082807.0f211578@xps13> <20180404090710.4f74b5b4@bbrezillon>
 <20180404090831.37e85d59@bbrezillon>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <6ae95633-d82f-1294-c7c7-db59c00d1d4d@free.fr>
Date: Thu, 5 Apr 2018 11:12:11 +0200
MIME-Version: 1.0
In-Reply-To: <20180404090831.37e85d59@bbrezillon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/04/2018 09:08, Boris Brezillon wrote:

> On Wed, 4 Apr 2018 09:07:10 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> 
>> On Wed, 4 Apr 2018 08:28:07 +0200
>> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>>
>>> Hi Xidong,
>>>
>>> As part of a reorganization in the NAND subsystem, you should now
>>> prefix your commit title this way:
>>>
>>>         mtd: rawnand: tango: fix memory leak
>>>
>>> Not sure if this patch is candidate to cc:stable?
>>>
>>> On Wed,  4 Apr 2018 11:05:51 +0800, Xidong Wang
>>> <wangxidong_97@163.com> wrote:
>>>   
>>>> In function tango_nand_probe(), the memory allocated by
>>>> clk_get() is not released on the normal path and
>>>> the error path that IS_ERR(nfc->chan) returns true.    
>>>
>>> The fact that the error path returns true looks out of topic, can you
>>> remove it? Just saying that you fix a memory leak is enough I guess.
>>>   
>>>> This will result in a memory leak bug.
>>>>
>>>> Signed-off-by: Xidong Wang <wangxidong_97@163.com>
>>>> ---
>>>>  drivers/mtd/nand/tango_nand.c | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
>>>> index c5bee00b..8083459 100644
>>>> --- a/drivers/mtd/nand/tango_nand.c
>>>> +++ b/drivers/mtd/nand/tango_nand.c
>>>> @@ -648,12 +648,15 @@ static int tango_nand_probe(struct platform_device *pdev)
>>>>  		return PTR_ERR(clk);
>>>>  
>>>>  	nfc->chan = dma_request_chan(&pdev->dev, "rxtx");
>>>> -	if (IS_ERR(nfc->chan))
>>>> +	if (IS_ERR(nfc->chan)) {
>>>> +		clk_put(clk);
>>>>  		return PTR_ERR(nfc->chan);
>>>> +	}
>>>>  
>>>>  	platform_set_drvdata(pdev, nfc);
>>>>  	nand_hw_control_init(&nfc->hw);
>>>>  	nfc->freq_kHz = clk_get_rate(clk) / 1000;
>>>> +	clk_put(clk);    
>>>
>>> If the clock is used only here, better do the frequency derivation
>>> right after the clock_get(), and follow with a clk_put()? This way you
>>> don't have to change the error path and 'related' actions remain
>>> grouped.  
>>
>> Hm, definitely not a good idea to release the reference you have on the
>> clk if the driver depends on it. I recommend using devm_clk_get() to
>> solve this leak.
> 
> BTW, it's also weird that the driver does not prepare_enable the clk.
> Marc, any comments?

I was not aware that clk_get() allocated memory, and required clk_put()
for cleanup. IIRC, I looked at Documentation/clk.txt

On tango, clocks are configured by the boot loader. The existing clk driver
provides only read access to various clocks -- except the CPU clock, which
can be changed by tweaking a post-divider. Tweaking the PLLs requires much
more complex code. The boot loader enables every clock, and Linux has no
way to gate any of them.

In the nfc driver, all I needed was the system frequency, since the NFC is
driven by the system clock (which can never be disabled).

Thus, I wrote the naive (and apparently incorrect)

  clk = clk_get(&pdev->dev, NULL);
  nfc->freq_kHz = clk_get_rate(clk) / 1000;


I suppose the following patch would fix the memory leak, and
matches what Miquèl suggested.

Regards.


diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index c5bee00b7f5e..fba162af333f 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -646,6 +646,8 @@ static int tango_nand_probe(struct platform_device *pdev)
        clk = clk_get(&pdev->dev, NULL);
        if (IS_ERR(clk))
                return PTR_ERR(clk);
+       nfc->freq_kHz = clk_get_rate(clk) / 1000;
+       clk_put(clk);
 
        nfc->chan = dma_request_chan(&pdev->dev, "rxtx");
        if (IS_ERR(nfc->chan))
@@ -653,7 +655,6 @@ static int tango_nand_probe(struct platform_device *pdev)
 
        platform_set_drvdata(pdev, nfc);
        nand_hw_control_init(&nfc->hw);
-       nfc->freq_kHz = clk_get_rate(clk) / 1000;
 
        for_each_child_of_node(pdev->dev.of_node, np) {
                err = chip_init(&pdev->dev, np);
