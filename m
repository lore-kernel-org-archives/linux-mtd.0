Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D239E-0005NG-KH
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 03:06:01 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joe Barnett <joseph.barnett@gmail.com>
In-Reply-To: <52249cdc0502171225706e3cf8@mail.gmail.com>
References: <52249cdc0502171225706e3cf8@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 18 Feb 2005 11:05:27 +0300
Message-Id: <1108713927.13420.14.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: symlink corruption in jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-02-17 at 15:25 -0500, Joe Barnett wrote:
> I am trying to put a jffs2 filesystem down on a G5 ppc64 system. I can
> build the filesystem fine, and get it into flash, mount it ect. The
> problem I am finding is that a large number of the symbolic links are
> corrupt. The file pointed to has garbage appended to the name (see
> below). If I try to create a new symlink, it also gets corrupted. I
> have turned on JFFS2 debug to level 3 and am still unable to locate
> the source of the issue...  I am using the following options when I
> run mkfs.jffs2:
I wonder did anybody successfully use JFFS2 on 64-bit machine?

> 
> mkfs.jffs2 -o myflashfs.img -d myroot -e 20000
Er, do you mean your Flash block is exactly 20000 bytes?

> 
> I am using Common Intel StrataFlash, which I have confirmed that
> driver is functional
One obvious thing I may suggest to exclude driver problems is to use
mtdram device. It emulates NOR flash in RAM. (mtd/drivers/mtdram.c). If
your problem won't go when you've utilized mtdram, the problem is most
probably in JFFS2.

Another good experiment is just to format your flash (flash_eraseall -j)
and mount it (empty). Then to try to play with symlinks there (touch
file; ln -s link file; and like). This will exclude the possibility of
mistakes when you create and flash your image.

> , as I can read and write large file to and from
> the flash fine, so it isn't in the driver.  Has anyone seen this issue
> before or does anyone have an idea of what may be causing this?  I did
> see Any help would be greatly appreciated.
Another things I may suggest are:

1. Try my recent patch: http://lists.infradead.org/pipermail/linux-
mtd/2005-February/011936.html

2. If you post next time, please provide the JFFS2 level 1 debug output.

3. Just in case, provide cat /proc/mtd output.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
