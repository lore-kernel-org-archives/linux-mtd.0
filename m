Received: from h-66-134-95-69.snvacaid.covad.net ([66.134.95.69]
	helo=mail.plexio.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BIGZ-00071A-AX
	for <linux-mtd@lists.infradead.org>; Thu, 01 May 2003 18:54:43 +0100
Received: from [24.78.211.48] (helo=ralph.plexio.private)
	by mail.plexio.com with esmtp (TLSv1:RC4-MD5:128)
	(Exim 3.34 #4)
	id 19BIGg-0007ve-00
	for linux-mtd@lists.infradead.org; Thu, 01 May 2003 10:54:50 -0700
From: Stephen Lee <splee@plexio.com>
To: mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <1051758076.27756.38.camel@ralph.plexio.private>
References: <1051745960.27756.15.camel@ralph.plexio.private>
	 <1051749228.27798.28.camel@ralph.plexio.private>
	 <200304302128.41316.mark@lakeshoremicro.com>
	 <1051758076.27756.38.camel@ralph.plexio.private>
Message-Id: <1051811686.27753.75.camel@ralph.plexio.private>
Mime-Version: 1.0
Date: 01 May 2003 10:54:47 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Which version of M-SYS DFORMAT?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-30 at 20:01, Stephen Lee wrote:
> Did I do something wrong during building of
> Grub-mtd? The main difficulty in build mtd-compliant Grub was making
> sure the autoconf and automake versions were correct. In the end I did
> get grub_firmware in the stage1 directory but how to be sure the build
> was correct?

Autoconf was indeed the problem. Upgrading it resulted in a functional
grub_firmware file. It turns out that I also needed to upgrade Perl :-(

Stephen
