Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOpT3-0003q8-IX
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 18:39:52 +0000
Subject: Re: [PATCH] Revert "dt-bindings: mtd: add sst25wf040b and en25s64 to
 sip-nor list"
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, shawnguo@kernel.org,
 robh@kernel.org, Richard Weinberger <richard@nod.at>
References: <20171212134012.19949-1-cyrille.pitchen@wedev4u.fr>
 <a4afeb2a-1578-4c85-9ae4-20b028fd382e@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0b3cc542-1b63-1d33-a4c5-ac0575cc0f2e@wedev4u.fr>
Date: Tue, 12 Dec 2017 19:39:25 +0100
MIME-Version: 1.0
In-Reply-To: <a4afeb2a-1578-4c85-9ae4-20b028fd382e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 12/12/2017 à 16:58, Marek Vasut a écrit :
> On 12/12/2017 02:40 PM, Cyrille Pitchen wrote:
>> This reverts commit b07815d4eaf658b683c345d6e643895a20d92f29.
>>
>> The reverted commit was merged into v4-15-rc1 by mistake: it was taken
>> from the IMX tree but the patch has never been sent to linux-mtd nor
>> reviewed by any spi-nor maintainers.
>>
>> Actually, it would have been rejected since we add new values for the
>> 'compatible' DT property only for SPI NOR memories that don't support
>> the JEDEC READ ID op code (0x9F).
>>
>> Both en25s64 and sst25wf040b support the JEDEC READ ID op code, hence
>> should use the "jedec,spi-nor" string alone as 'compatible' value.
>>
>> See the following link for more details:
>> http://lists.infradead.org/pipermail/linux-mtd/2017-November/077425.html
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 

Applied on the spi-nor/fixes branch of linux-mtd

>> ---
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> index 376fa2f50e6b..956bb046e599 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> @@ -13,7 +13,6 @@ Required properties:
>>                   at25df321a
>>                   at25df641
>>                   at26df081a
>> -                 en25s64
>>                   mr25h128
>>                   mr25h256
>>                   mr25h10
>> @@ -33,7 +32,6 @@ Required properties:
>>                   s25fl008k
>>                   s25fl064k
>>                   sst25vf040b
>> -                 sst25wf040b
>>                   m25p40
>>                   m25p80
>>                   m25p16
>>
> 
> 
