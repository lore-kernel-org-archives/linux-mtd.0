Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUcNM-0000Yx-Rd
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 07:40:51 +0000
Subject: Re: 3GB limit?  *2* GB limit?!
From: Artem Bityutskiy <dedekind@infradead.org>
To: Miles Nordin <carton@Ivy.NET>
In-Reply-To: <oqvdrrrpaf.fsf@castrovalva.Ivy.NET>
References: <oqvdrrrpaf.fsf@castrovalva.Ivy.NET>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Feb 2009 09:40:40 +0200
Message-Id: <1233733240.5138.28.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-03 at 19:58 -0500, Miles Nordin wrote:
> I'm trying to experiment with ubifs on a 16GB USB stick.  I've
> downloaded and built:

snip

> -----8<-----
> # uname -a
> Linux fishstick 2.6.25-gentoo-r8 #2 SMP PREEMPT Wed Feb 4 05:23:36 UTC 2009 i686 AMD Phenom(tm) 9850 Quad-Core Processor AuthenticAMD GNU/Linux
> # ls -l /dev/mtd*
> ls: cannot access /dev/mtd*: No such file or directory
> # modprobe block2mtd block2mtd=/dev/sdj,128KiB
> # modprobe mtdchar
> # ls -l /dev/mtd*
> crw-rw---- 1 root root 90, 0 Feb  4 06:29 /dev/mtd0
> crw-rw---- 1 root root 90, 1 Feb  4 06:29 /dev/mtd0ro
> fishstick devices # ubiformat /dev/mtd0
> ubiformat: mtd0 (RAM-based), size 3246391296 bytes (3.0 GiB), 131072 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 1 bytes
> libscan: scanning eraseblock 16384 -- 66 % complete  libmtd: error!: cannot seek mtd0 to offset 18446744071562067968
>         error 22 (Invalid argument)
> ubiformat: error!: failed to scan mtd0 (/dev/mtd0)
> # fdisk /dev/sdj
> Device contains neither a valid DOS partition table, nor Sun, SGI 

MTD user-space interface is 32-bit, and is simited by 2GiB. You have to
upgrade it to use larger devices.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
