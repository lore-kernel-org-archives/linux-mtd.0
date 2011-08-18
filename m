Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qu5xN-0007wx-Ln
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2011 17:00:38 +0000
Message-ID: <4E4D452C.7050805@parrot.com>
Date: Thu, 18 Aug 2011 19:00:28 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "b35362@freescale.com" <b35362@freescale.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
In-Reply-To: <1313634783-8855-1-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	Li Yang <leoli@freescale.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

b35362@freescale.com a écrit :
> From: Liu Shuo <b35362@freescale.com>
> 
> Freescale FCM controller has a 2K size limitation of buffer RAM. In order
> to support the Nand flash chip whose page size is larger than 2K bytes,
> we divide a page into multi-2K pages for MTD layer driver. In that case,
> we force to set the page size to 2K bytes. We convert the page address of
> MTD layer driver to a real page address in flash chips and a column index
> in fsl_elbc driver. We can issue any column address by UA instruction of
> elbc controller.
> 
Why do you need to do that ?

When mtd send you a 4k page, why can't you write it by 2*2k pages write ?

Even better send the first 2K and then if your controller allow it send the
remaining 2K without command/address phase.


Matthieu
