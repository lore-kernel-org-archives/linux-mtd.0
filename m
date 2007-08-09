Received: from rv-out-0910.google.com ([209.85.198.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJCBK-00012C-Ka
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 13:52:25 -0400
Received: by rv-out-0910.google.com with SMTP id c24so446691rvf
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Aug 2007 10:52:18 -0700 (PDT)
Message-ID: <4f6ba3b0708091052n132bebb8rcbc0597cb35c75db@mail.gmail.com>
Date: Thu, 9 Aug 2007 13:52:18 -0400
From: "Bob Beers" <bob.beers@gmail.com>
To: "Andy Kennedy" <akennedy@techmoninc.com>
Subject: Re: DiskOnChip 2000 (DOC 2000) woes.
In-Reply-To: <46BB498D.9040707@techmoninc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46B76F31.6020507@techmoninc.com> <46B9EE9B.7060805@techmoninc.com>
	<46BB21F1.3060109@techmoninc.com> <46BB498D.9040707@techmoninc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/9/07, Andy Kennedy <akennedy@techmoninc.com> wrote:

> root@winsys:~# modprobe nftl
> root@winsys:~# fdisk /dev/nftla

Have you tried compiling the MTD, MTD_NAND, MTD_NAND_DISKONCHIP
 parts into the kernel rather than as modules?

If you do that, what kind of dmesg output do you get related to MTD?

>   I created the block devices nftla{,1,2} using:
> mknod /dev/nftla b 93 0
> and I end up with a device:
> brw-rw---- 1 root disk 93, 0 2007-08-09 10:52 /dev/nftla

my device nodes look like this:
bash-3.00# ls /dev/nftla* -al
brw-r--r--  1 root root 93, 0 Mar  4  2005 /dev/nftla
brw-r--r--  1 root root 93, 1 Mar  4  2005 /dev/nftla1
brw-r--r--  1 root root 93, 2 Mar  4  2005 /dev/nftla2
brw-r--r--  1 root root 93, 3 Mar  4  2005 /dev/nftla3

I never had any success with 32M, but 8M, 16M, 64M worked for me.
(48M worked, but had incredibly slow boot time.)

Does your process work with other sizes of DiskOnChip 2000?

-Bob
