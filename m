Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj0hv-00070g-EA
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 18:34:35 +0000
From: "Mark Richards" <markr@massmicro.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Tue, 20 Jan 2004 13:32:21 -0500
Message-ID: <001201c3df83$bded6f30$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <1074622256.7885.12.camel@hades.cambridge.redhat.com>
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you that worked.  

I'll let you know what I find as to the freeze problem once the new kernel
is in place.

Would you like some text for updating the HOWTO document?


Mark Richards


> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Tuesday, January 20, 2004 13:11
> To: Mark Richards
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: MTD - DOC 2000 freezes on umount
> 
> On Tue, 2004-01-20 at 13:04 -0500, Mark Richards wrote:
> > drivers/mtd/chips/Config.in: 14: unknown command
> 
> Try 'make oldconfig' instead.
> 
> --
> dwmw2
