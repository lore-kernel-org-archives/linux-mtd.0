Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f432l-0007vf-WC
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 11:27:06 +0000
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
 <6ae95633-d82f-1294-c7c7-db59c00d1d4d@free.fr>
 <20180405115448.36d2372f@bbrezillon>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <d7a24775-1d4f-afd4-bec0-1850eb337183@free.fr>
Date: Thu, 5 Apr 2018 13:26:31 +0200
MIME-Version: 1.0
In-Reply-To: <20180405115448.36d2372f@bbrezillon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/04/2018 11:54, Boris Brezillon wrote:

> On Thu, 5 Apr 2018 11:12:11 +0200, Marc Gonzalez wrote:
> 
>> I was not aware that clk_get() allocated memory, and required clk_put()
>> for cleanup. IIRC, I looked at Documentation/clk.txt
>>
>> On tango, clocks are configured by the boot loader. The existing clk driver
>> provides only read access to various clocks -- except the CPU clock, which
>> can be changed by tweaking a post-divider. Tweaking the PLLs requires much
>> more complex code. The boot loader enables every clock, and Linux has no
>> way to gate any of them.
> 
> Well, even if that's not supported today, it's always a good practice
> to retain reference and prepare/enable clks your HW depends on. This
> change should be harmless and when/if you someday decide to provide a
> way to gate clks, it will work out of the box.

IIUC, you're saying:
1) use devm_clk_get() instead of clk_get() to solve the memory leak
2) call clk_prepare_enable() before clk_get_rate() even if the former is a no-op today

The following patch implements these suggestions.
(Only compile-tested)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index c5bee00b7f5e..39d190b7521f 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -643,7 +643,7 @@ static int tango_nand_probe(struct platform_device *pdev)
 
        writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
 
-       clk = clk_get(&pdev->dev, NULL);
+       clk = devm_clk_get(&pdev->dev, NULL);
        if (IS_ERR(clk))
                return PTR_ERR(clk);
 
@@ -651,6 +651,10 @@ static int tango_nand_probe(struct platform_device *pdev)
        if (IS_ERR(nfc->chan))
                return PTR_ERR(nfc->chan);
 
+       err = clk_prepare_enable(clk);
+       if (err)
+               return err;
+
        platform_set_drvdata(pdev, nfc);
        nand_hw_control_init(&nfc->hw);
        nfc->freq_kHz = clk_get_rate(clk) / 1000;
