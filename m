Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMapd-0004fS-Ps
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 03:20:23 +0000
Date: Wed, 6 Feb 2008 01:46:18 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
Subject: Re: what is the user space header file for mtdchar.c kernel driver
Message-ID: <20080206014618.GB5042@shareable.org>
References: <001801c867e6$dbadab30$65053c0a@telxsi.com>
	<9b52d64c0802051905p5db6b6e1w9b065ffc10243f02@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b52d64c0802051905p5db6b6e1w9b065ffc10243f02@mail.gmail.com>
Cc: vishalk@tataelxsi.co.in, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vinit Agnihotri wrote:
> What exactly do you want to do with mtdchar??
> To access char driver you need to use dev file /dev/mtdchar,
> it doesn't need any header file.

Actually, to use the dev file's ioctls, you really do need a copy of
<mtd/mtd-user.h> and <mtd/mtd-abi.h>.

They are in the Linux kernel source tree under linux/include/mtd/, and
also in the flash utilities under include/mtd/.

-- Jamie
