Received: from mailbox1.avalonworks.net ([216.58.97.66])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AR06E-0004fS-9P
	for <linux-mtd@lists.infradead.org>; Tue, 02 Dec 2003 02:17:14 +0000
Received: from localhost (i216-58-9-6.igs.net [216.58.9.6])
	hB22FXSP016624	for <linux-mtd@lists.infradead.org>;
	Mon, 1 Dec 2003 21:15:34 -0500 (EST)
	(envelope-from ilatypov@infradead.org)
Received: from ilgiz by localhost with local (Exim 4.24)
	id 1AR04b-0000JS-0d
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2003 21:15:33 -0500
Date: Mon, 1 Dec 2003 21:15:32 -0500
From: Ilguiz Latypov <ilatypov@infradead.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20031202021532.GA1175@ei.homeip.net>
References: <08F9C91BD42DD411A48900C04F109FD4C733AC@atlaspdc.atlas-tech.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08F9C91BD42DD411A48900C04F109FD4C733AC@atlaspdc.atlas-tech.com>
Sender: Ilguiz Latypov <ilatypov@infradead.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: DOC + GRUB + MTD + compressed ext2 root ramdisk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Mark,

On Mon, Dec 01, 2003 at 04:25:39PM -0500, mark a. mixson wrote:

> Kernel panic: No init found. Try passing init= option to kernel.

Have you tried chroot-ing into the ramdisk image and starting /bin/sh
there?

One can also try to create a romfs ramdisk for a read-only boot.  This
would help to dissect the problem area.

-- 
Ilguiz
