Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lk0rm-0005qC-UP
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 18:51:58 +0000
Date: Wed, 18 Mar 2009 13:51:30 -0500
From: Scott Wood <scottwood@freescale.com>
To: Wolfgang Grandegegr <wg@grandegger.com>
Subject: Re: [PATCH 4/4] powerpc/85xx: TQM8548: Update DTS file for
	multi-chip support
Message-ID: <20090318185130.GD3410@loki.buserror.net>
References: <1237281143-8768-1-git-send-email-wg@grandegger.com>
	<1237281143-8768-2-git-send-email-wg@grandegger.com>
	<1237281143-8768-3-git-send-email-wg@grandegger.com>
	<1237281143-8768-4-git-send-email-wg@grandegger.com>
	<1237281143-8768-5-git-send-email-wg@grandegger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1237281143-8768-5-git-send-email-wg@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 17, 2009 at 10:12:22AM +0100, Wolfgang Grandegegr wrote:
> --- a/arch/powerpc/boot/dts/tqm8548.dts
> +++ b/arch/powerpc/boot/dts/tqm8548.dts
> @@ -389,6 +389,11 @@
>  			reg = <3 0x0 0x800>;
>  			fsl,upm-addr-offset = <0x10>;
>  			fsl,upm-cmd-offset = <0x08>;
> +			wait-flags = <0x05>;
> +			/* Multi-chip device */
> +			fsl,upm-mar-chip-offset = <0x200>;
> +			max-chips = <2>;
> +			chip-offset = <0x200>;

Device-specific properties (especially vaguely-named ones like wait-flags)
should have at least an "fsl," prefix (or better, an "fsl,upm-" or
"fsl,upm-nand-" prefix).

Please update Documentation/powerpc/dts-bindings/fsl/upm-nand.txt with the
definitions of these new properties.

-Scott
