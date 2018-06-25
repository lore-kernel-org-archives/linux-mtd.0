Received: from mail-pg0-f68.google.com ([74.125.83.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXYvn-0003A5-Qq
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 21:21:53 +0000
Received: by mail-pg0-f68.google.com with SMTP id i7-v6so6624901pgp.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 14:21:40 -0700 (PDT)
Date: Mon, 25 Jun 2018 15:21:37 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: document Broadcom's TRX firmware
 format binding
Message-ID: <20180625212137.GA16487@rob-hp-laptop>
References: <20180612104434.15232-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180612104434.15232-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 12, 2018 at 12:44:33PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom based home router devices use TRX firmware format. It's a
> container that can hold few partitions. If operating system is expected
> to access them it has to understand that format and parse flash data
> accordingly.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/mtd/partitions/brcm,trx.txt           | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> new file mode 100644
> index 000000000000..e590b884e5ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> @@ -0,0 +1,35 @@
> +Broadcom TRX Container Partition
> +================================
> +
> +TRX is Broadcom's official firmware format for the BCM947xx boards. It's used by
> +most of the vendors building devices based on Broadcom's BCM47xx SoCs and is
> +supported by the CFE bootloader.
> +
> +Design of the TRX format is very minimalistic. Its header contains
> +identification fields, CRC32 checksum and the locations of embedded partitions.
> +Its purpose is to store a few partitions in a format that can be distributed as
> +a standalone file and written in a flash memory.
> +
> +Container can hold up to 4 partitions. The first partition has to contain a
> +device executable binary (e.g. a kernel) as it's what the CFE bootloader starts
> +executing. Other partitions can be used for operating system purposes. This is
> +useful for systems that keep kernel and rootfs separated.
> +
> +TRX doesn't enforce any strict partition boundaries or size limits. All
> +partitions have to be less than the 4GiB max size limit.
> +
> +There are two existing/known TRX variants:
> +1) v1 which contains 3 partitions
> +2) v2 which contains 4 partitions
> +
> +Required properties:
> +- compatible : (required) must be either: "brcm,trx-v1" or "brcm,trx-v2"
> +	followed by "brcm,trx"

What is the purpose of brcm,trx? Either that alone is enough or you need 
v1/v2 to distinguish the difference. You shouldn't need both.

Rob
