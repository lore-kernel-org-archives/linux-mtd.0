Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bx9HV-0000ZH-Nb
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 09:04:59 +0000
Received: by mail-lf0-x22d.google.com with SMTP id x79so76815040lff.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2016 02:04:37 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: nand: Add OX820 NAND Support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20161020084901.6486-1-narmstrong@baylibre.com>
 <20161020110025.11b06090@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel@makrotopia.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <d64d3ed6-b02f-2ad8-3df2-91b3e6d22626@baylibre.com>
Date: Thu, 20 Oct 2016 11:04:29 +0200
MIME-Version: 1.0
In-Reply-To: <20161020110025.11b06090@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/20/2016 11:00 AM, Boris Brezillon wrote:
> On Thu, 20 Oct 2016 10:49:01 +0200
> Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> Add NAND driver to support the Oxford Semiconductor OX820 NAND Controller.
>> This is a simple memory mapped NAND controller with single chip select and
>> software ECC.
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/mtd/oxnas-nand.txt         |  41 +++++
>>  drivers/mtd/nand/Kconfig                           |   5 +
>>  drivers/mtd/nand/Makefile                          |   1 +
>>  drivers/mtd/nand/oxnas_nand.c                      | 196 +++++++++++++++++++++
>>  4 files changed, 243 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/oxnas-nand.txt
>>  create mode 100644 drivers/mtd/nand/oxnas_nand.c
>>
>> Changes since v1 http://lkml.kernel.org/r/20161019145523.6763-1-narmstrong@baylibre.com :
>>  - Simplify cmd_ctrl command and drop the ctrl address offset
>>  - Change oxnas_nand struct name to oxnas_nand_ctrl
>>  - Update DT-Bindings example to reflect the ctrl->chip->partitions hierarchy
>>
>> Changes since RFC http://lkml.kernel.org/r/20161018090927.1990-1-narmstrong@baylibre.com :
>>  - Avoid using chip->IO_ADDR*
>>  - Use new DT structure
>>  - Assign a chip for the subnode
>>  - Use the nand_hw_control structure
>>  - Cleanup probe
>>  - Cleanup cmd_ctrl by using a context ctrl offset used in write_bytes
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
>> new file mode 100644
>> index 0000000..33a77b8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
>> @@ -0,0 +1,41 @@
>> +* Oxford Semiconductor OXNAS NAND Controller
>> +
>> +Please refer to nand.txt for generic information regarding MTD NAND bindings.
>> +
>> +Required properties:
>> + - compatible: "oxsemi,ox820-nand"
>> + - reg: Base address and length for NAND mapped memory.
>> +
>> +Optional Properties:
>> + - clocks: phandle to the NAND gate clock if needed.
>> + - resets: phandle to the NAND reset control if needed.
>> +
>> +Example:
>> +
>> +nand: nand-controller@41000000 {
> 
> 'nandc:' or 'nand_ctrl:'
> 
> Otherwise it may conflict with a NAND chip alias.
> The rest looks good, so no need to send a new version (I can fix it when
> applying the patch).

OK, thanks, I will fix in the dtsi accordingly.

> 
> One last thing, I saw there was other people owning boards with this
> controller. Can I get one or two Tested-by?

I would like too, but it seems I'm the only one working upstream for now....
I hope it will change in near future once there is enough upstream for booting the platform.

> 
> Thanks taking my reviews into account.

Thanks for reviewing !

Neil
> 
> Regards,
> 
> Boris
> 
