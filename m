Received: from mail-bw0-f67.google.com ([209.85.214.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTFbn-0003tG-GL
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 15:19:08 +0000
Received: by bwz3 with SMTP id 3so1144890bwz.6
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Dec 2010 07:19:05 -0800 (PST)
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rob Landley <rob@landley.net>
In-Reply-To: <201012150031.21417.rob@landley.net>
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<201012141849.03926.rob@landley.net>
	<20101215011904.GA24292@falooley.org>
	<201012150031.21417.rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Dec 2010 17:18:31 +0200
Message-ID: <1292512711.2364.85.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Jeff Dike <jdike@addtoit.com>,
	Jason Lunz <lunz@acm.org>, lkml <linux-kernel@vger.kernel.org>,
	richard -rw- weinberger <richard.weinberger@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-15 at 00:31 -0600, Rob Landley wrote:
> That is awesome and I'm not finding any documentation on it...  Ah:
> 
>   http://wiki.maemo.org/Modifying_the_root_image#Block_device_emulating_an_MTD_device
> 
> Wow that's awkward.  Let's see, that says...
> 
>   mknod /tmp/mtdblock0 b 31 0
>   modprobe loop
>   losetup /dev/loop0 rootfs.jffs2
>   modprobe mtdblock
>   modprobe block2mtd
>   # Note the ,128KiB is needed (on 2.6.26 at least) to set the
>   # eraseblock  size.
>   echo "/dev/loop0,128KiB" > /sys/module/block2mtd/parameters/block2mtd
>   modprobe jffs2
>   mount -t jffs2 /tmp/mtdblock0 /media/jffs2

You should not need mtdblock in modern kernels, it is legacy. You should
be abole to mount jffs2 on top of mtd0 with

mount -t jffs2 mtd0 /media/jffs2

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
