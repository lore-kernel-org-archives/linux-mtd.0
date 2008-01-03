Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JAReD-0004Cr-FJ
	for linux-mtd@lists.infradead.org; Thu, 03 Jan 2008 15:06:24 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: haver@vnet.ibm.com
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
Date: Thu, 3 Jan 2008 16:05:13 +0100
References: <20071219154137.23264.28116.sendpatchset@golum>
	<1198075329.18962.70.camel@sauron>
	<1199364699.7726.34.camel@august>
In-Reply-To: <1199364699.7726.34.camel@august>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200801031605.14326.arnd@arndb.de>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 January 2008, Frank Haverkamp wrote:
> > We can autoprobe the VID header offset, unless the MTD device is empty,
> > in which case UBI automatically formats it.
> 
> I do not like auto-probing the VID hdr offset. In my eyes the user
> should have the flexibility to define where his VID-hdr and data start
> e.g. like in our case to have influence on if data is starting on
> subpage- or page-boundaries. I also think that the autoprobe feature
> would add more complexity to the code.

I agree that the user should have the flexibility to set these parameters,
but AFAICS, that is only relevant during initialization (formatting) of
the medium.

However, I find it essential that it's possible to do autoprobing of
existing media, by whatever means.
If you don't want to do it in the kernel, a user space helper might
be useful, preferably one that does not require ioctls, so it can be
done as a shell script.

	Arnd <><
