Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2kzH-0002aJ-MZ
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 05:36:01 -0400
Received: by ug-out-1314.google.com with SMTP id t39so1235873ugd
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Jun 2007 02:35:58 -0700 (PDT)
Message-ID: <4dde4acb0706250235g121e3e8ch8bd457d4fd604907@mail.gmail.com>
Date: Mon, 25 Jun 2007 15:05:58 +0530
From: "Midhun Agnihotram" <agnimidhun@gmail.com>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: /proc/mtd file does not show partitions
In-Reply-To: <4dde4acb0706242336v5569a147l6a38bb146d417187@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4dde4acb0706192320n7ca4157q1219adfb68e50ce1@mail.gmail.com>
	<46791199.7020402@cetrtapot.si>
	<4dde4acb0706202201y7369cc33kc438f15f7091c18c@mail.gmail.com>
	<467A3861.2050801@cetrtapot.si>
	<4dde4acb0706242336v5569a147l6a38bb146d417187@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>    The rootfs image created is of 1MB, even though the pad option has
> been enabled to create an image size of 4MB.
>
      I am able to create a 4MB filesystem now. I had changed the -p
option to --pad as follows:

# ./mkfs.jffs2  -l -o rootfs-jffs2.img -r rootfs  -e 0x20000 --pad=0x400000

    And lo..It worked fine. The errors which used come as soon as the
kernel loading ends are all gone. But there is still one problem. It
says the file system is read-only and does not allow me to create a
folder.

# mount
rootfs on / type rootfs (rw)
/dev/root on / type jffs2 (rw)
/proc on /proc type proc (rw)
# mkdir midhun
Write of 68 bytes at 0x000e482c failed. returned -30, retlen 3270162828
Write of 68 bytes at 0x000e4870 failed. returned -30, retlen 3270162828
mkdir: cannot create directory 'midhun': Read-only file system

   My boot arguments are :

mem=48M console=ttyS0,115200 console=tty0 root=/dev/mtdblock4 rw
rootfstype=jffs2 init=/sbin/init ip=on

   Why is it saying that the filesystem is read-only?? The mount
command says that every file system mounted is rw. But still I am not
able to write. What is the problem??

Thanks,
Midhun.
