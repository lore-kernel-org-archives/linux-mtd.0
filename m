Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiYQ3-0001gY-7j
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 21:30:47 +0000
Received: by eekc13 with SMTP id c13so17258772eek.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 13:30:45 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
Date: Wed, 4 Jan 2012 22:30:42 +0100
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <201201040150.39285.marek.vasut@gmail.com> <4F03BE34.6020003@newsguy.com>
In-Reply-To: <4F03BE34.6020003@newsguy.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201042230.42456.marek.vasut@gmail.com>
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 01/03/2012 04:50 PM, Marek Vasut wrote:
> >> This patch adds a driver for the M-Sys / Sandisk diskonchip G4 nand
> >> flash found in various smartphones and PDAs, among them the Palm
> >> Treo680, HTC Prophet and Wizard, Toshiba Portege G900, Asus P526, and
> >> O2 XDA Zinc.  It was tested on the Treo 680, but should work
> >> generically.
> >> 
> >> Since v3, this patch adds power management functions, a scan of the
> >> factory bad block table during initialization, several fixes, and more
> >> extensive testing. Also, the platform data header file, which only
> >> contained partitioning information, was removed.  Command-line
> >> partitioning can be used, at least until an mtd parser is written for
> >> the saftl format with which these chips are shipped.
> > 
> > Hey, please run it through ./scripts/checkpatch.pl, it'll likely reveal a
> > few mistakes. Thanks for the code.
> > 
> > M
> 
> I did.  0 errors, 0 warnings.

Oh ok, good :)

> 
> Thanks,
> Mike
