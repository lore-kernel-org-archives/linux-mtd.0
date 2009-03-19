Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LkLgX-0007sw-Bz
	for linux-mtd@lists.infradead.org; Thu, 19 Mar 2009 17:05:45 +0000
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	n2JH5VUV023547 for <linux-mtd@lists.infradead.org>;
	Thu, 19 Mar 2009 10:05:31 -0700 (MST)
Received: from ld0162-tx32.am.freescale.net (ld0162-tx32.am.freescale.net
	[10.82.19.112])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id n2JH5Ud8021069
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Mar 2009 12:05:30 -0500 (CDT)
Date: Thu, 19 Mar 2009 12:05:30 -0500
From: Scott Wood <scottwood@freescale.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH v2 4/5] powerpc: NAND: FSL UPM: document new bindings
Message-ID: <20090319170530.GA2744@ld0162-tx32.am.freescale.net>
References: <1237475768-11481-1-git-send-email-wg@grandegger.com>
	<1237475768-11481-2-git-send-email-wg@grandegger.com>
	<1237475768-11481-3-git-send-email-wg@grandegger.com>
	<1237475768-11481-4-git-send-email-wg@grandegger.com>
	<1237475768-11481-5-git-send-email-wg@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1237475768-11481-5-git-send-email-wg@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 19, 2009 at 04:16:07PM +0100, Wolfgang Grandegger wrote:
> +Optional properties:
> +- fsl,upm-mar-offset : use the UPM machine address register to drive a
> +  		       custom chip select logic using the specified
> +		       offset.

Your example uses the name fsl,upm-mar-chip-offset instead.

> +- chip-offset : address offset between chips for multi-chip support.

How is this different from fsl,upm-mar-offset?

-Scott
