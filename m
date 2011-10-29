Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RK4wM-0004SI-UR
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 09:10:59 +0000
Date: Sat, 29 Oct 2011 11:09:46 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 12/13] mtd/docg3: add ECC correction code
Message-ID: <20111029090946.GB12046@parrot.com>
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<1319824292-11085-13-git-send-email-robert.jarzmik@free.fr>
	<20111029085248.GA12046@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20111029085248.GA12046@parrot.com>
Cc: "mikedunn@newsguy.com" <mikedunn@newsguy.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 29, 2011 at 10:52:48AM +0200, Ivan Djelic wrote:
> Just a side note: if you need to get maximum performance from the BCH library,
> you can set fixed values for M and T in your Kconfig, with something like:
> 
>  config MTD_DOCG3
>         tristate "M-Systems Disk-On-Chip G3"
> 	select BCH

Oops, just noticed that you would also need to add this line here:
	select BCH_CONST_PARAMS

>         ---help---
>           This provides an MTD device driver for the M-Systems DiskOnChip
>           G3 devices.
> 
> if MTD_DOCG3
> config BCH_CONST_M
> 	default 14
> config BCH_CONST_T
> 	default 4
> endif
> 
> 
> The only drawback is that it won't work if you select your DOCG3 driver and, at
> the same time, other MTD drivers that also use fixed, but different parameters.
