Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15doeQ-0006wn-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 09:00:10 +0100
Date: Mon, 3 Sep 2001 10:07:12 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: Veikko Werner <veikko.werner@logware.de>
cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: Re: AW: DOC2000 Boot de-ja-vue - add... 
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D319FA655@exchange.ten.logware.de>
Message-ID: <Pine.LNX.4.21.0109030958570.26034-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi

You don't have a libraries in your /lib directory. You have symbolic link
only but you don't have the ld-2.2.2.so, libc-2.2.2.so, ... etc.

./lib:
insgesamt 201
lrwxrwxrwx    1 root     root           11 Sep  3 14:41 ld-linux.so.2 ->
ld-2.2.2.so
lrwxrwxrwx    1 root     root           17 Sep  3 14:41 libcrypt.so.1 ->
libcrypt-2.2.2.so
lrwxrwxrwx    1 root     root           13 Sep  3 14:41 libc.so.6 ->
libc-2.2.2.so
..................

You must copy it into lib directory
Which library you need you test by ldd needed_executable.
For example:
$ ldd /sbin/init
        libc.so.6 => /lib/libc.so.6 (0x40020000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)

(maybe libc and ld-linux only).

Good luck!

Martin

> 
> Thanks David,
> 
> that was a good hint. 
> After I mount /dev/nftla1 I can do /mnt/nftla1/sbin/init , sh, bash ...
> but if I use # chroot /mnt/nftla1 /sbin/init 
> I get 'chroot: can not execute /sbin/init: No such file or directory'
> 
> okay now I know there's a problem. But I've no idea how to solve it.
> I attach a listing of my root-fs. maybe one can see an error.
> 
> Veikko
> 
> -----Originalnachricht-----
> Von: David Woodhouse
> An: Veikko Werner
> Cc: linux-mtd@lists.infradead.org
> Gesendet: 31.08.01 17:41
> Betreff: Re: DOC2000 Boot de-ja-vue - add... 
> 
> 
> veikko.werner@logware.de said:
> > conclusion:  MTD and NFTL load successfully kernels says "root
> > mounted" so I should must have the files I have when I mount it from
> > HD but that seems to be not right maybe access to the DOC is to slow?
> > Can I pass some arguments for slowing down ? 
> 
> Boot from the hard drive and check you can run /sbin/init and /bin/sh 
> from the DiskOnChip:
> 
>  mount /dev/nftla1 /mnt
>  chroot /mnt /bin/sh
> 
> 
> --
> dwmw2
> 
> 
> 
