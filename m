Received: from outbound.mobilygen.com ([72.166.0.2]
	helo=mailhost.mobilygen.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBwu2-0002jf-Vu
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 18:40:58 +0000
Subject: Re: Flash_eraseall -j and cowardly refusing to mount
From: Jeff Hane <jhane@mobilygen.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1199718040.27304.12.camel@pmac.infradead.org>
References: <4B760ED6D70BBC4EBFC0AEFDAFB2392A0AEB9FBC@NTHT202E.siemenscomms.co.uk>
	<1199718040.27304.12.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Mon, 07 Jan 2008 10:39:19 -0800
Message-Id: <1199731159.6533.10.camel@qu062.quarc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 But doesn't this only fix the case where you have contiguous 8 bytes to
write the cleanmarker?  flash_eraseall -j uses MTD_PLACE to write the
cleanmarker BUT jffs2 uses MTD_AUTO to read the cleanmarker.
 For example, if your oob area has byte 0 as the bad block indicator and
bytes 8-10 have ecc, there are only 7 consecutive free bytes.
flash_eraseall -j will only write 7 bytes so jffs2 will fail when
mounting the filesystem because it will read 8 bytes.  The 8th byte,
which will be byte 12, will still be FF.
  It seems there should be an ioctl that would allow one to read/write
the oob area using MTD_AUTO???

jeff

On Mon, 2008-01-07 at 15:00 +0000, David Woodhouse wrote:
> On Mon, 2008-01-07 at 12:16 +0000, Phillips, Owain wrote:
> > Hi linux-mtd@lists.infradead.org,
> > 
> > We just upgraded to mtd-utils-1.0.1 on our 2.6.23 target and I am
> > getting problems with flash_eraseall -j where the mount fails.
> 
> It ought to be fixed by this:
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=09b3fba5
> 
