Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFltJ-00074r-EB
 for linux-mtd@lists.infradead.org; Fri, 17 Nov 2017 19:01:32 +0000
Received: by mail-wm0-x241.google.com with SMTP id z3so8351350wme.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2017 11:01:08 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
 linux-mtd@lists.infradead.org
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <828f0e4a-c93b-2929-60f5-e3908ae198c1@gmail.com>
Date: Fri, 17 Nov 2017 20:01:03 +0100
MIME-Version: 1.0
In-Reply-To: <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
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

On 11/17/2017 06:36 PM, Cyrille Pitchen wrote:
> Hi Fabrizio,
> 
> sorry but I won't apply this patch.

ACK on that, if it can be detected with READID or SFDP, use that and
don't add redundant stuff into the DT bindings.

btw which renesas board has this SPI NOR on it ?

> New values for the 'compatible' DT properties should only be added for
> memory parts not supporting the JEDEC READ ID (0x9F) command.
> 
> SST25 memories do support this command hence should use the "jedec,spi-nor"
> value alone. For historical reasons, some DT nodes set their 'compatible'
> string to something like "<vendor>,<model>", "jedec,spi-nor".
> It should work as expected in most case however I discourage from doing so
> in new device trees because it may have some side effects especially when
> the m25p80.c driver is used between the spi-nor.c driver and the SPI
> controller driver.
> 
> It's all about setting the 2nd parameter of spi_nor_scan(), the 'name'
> parameter, as NULL when possible. This parameter should be set to a non NULL
> value only for memories not supporting the JEDEC READ ID op code (0x9F).
> 
> Best regards,
> 
> Cyrille
> 
> Le 24/10/2017 à 15:50, Fabrizio Castro a écrit :
>> There are a few DT files that make use of sst25vf016b in their
>> compatible strings, and the driver supports this chip already.
>> This patch improves the documentation and therefore the result
>> of ./scripts/checkpatch.pl.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> Signed-off-by: Chris Paterson <Chris.Paterson2@renesas.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Thank you Rob, thank you Geert, and sorry for the delay on this one.
>> Here is v2.
>>
>> Changes in v2:
>> * fixed subject prefix
>> * added changelog
>>
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> index 4cab5d8..bf56d77 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> @@ -31,6 +31,7 @@ Required properties:
>>                   s25sl12801
>>                   s25fl008k
>>                   s25fl064k
>> +                 sst25vf016b
>>                   sst25vf040b
>>                   sst25wf040b
>>                   m25p40
>>
> 


-- 
Best regards,
Marek Vasut
