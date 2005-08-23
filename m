Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7YBu-0008VH-Sd
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 08:48:01 -0400
Message-ID: <430B1B29.2010004@inf.u-szeged.hu>
Date: Tue, 23 Aug 2005 14:48:41 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Suresh K <sureshkanniappan@gmail.com>
References: <802ad8b60508222243345b5e18@mail.gmail.com>
	<802ad8b60508230349683751c6@mail.gmail.com>
In-Reply-To: <802ad8b60508230349683751c6@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Mount issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>  1. Compiled the kernel with JFFS2 summary support. Created the JFFS2
>image with the following command.
>      mkfs.jffs2 -d testjffs2 -e 0x40000 --pad=0x7800000 -o jffs2.img -v
>
>      This comand created the JFFS2 image of size 120MB.
>      Copied the jffs2.img to one of the partition in Hard Disk.
>Mounted
>      the partition using blkmtd support. It takes around 27 seconds
>to
>      mount.
>
>      Why the mount time is high even if the kernel having the "JFFS2
>summary" support?.
>  
>
Because there was no summary support in your image, so the original
scanning method had to be applied. Summary support means to process this
summary information and generate it automatically if you write date onto
the filesystem.

>   2. Created the JFFS2 image with summary information inbuilt support
>using sumtool2 utility.
>         sumtool2 -e 0x40000 -i jffs2.img -o jffs2-sum.img
>
>       Copied the jffs2-sum.img to other partition in Hard Disk.
>Mounted
>       the partition using blkmtd support. It takes around 6 seconds
>to
>       mount.
>Another problem is that "Segmentation fault" occurs when copying a
>directory of size 10MB to JFFS2 partition after mount.
>
>Following are the error posted when copying the directory.
>  
>
Can you send me more information about it? For example kernel log with
debug level 1. And please make sure that you use the latest mtd snapshot
with newest summary patch - use only erase block summary, centralized
summary is now under construction.

It would be also good to know that if it works without summary.

Another question: is there any reason that you use 2.6.10 instead of the
newest kernel?

Bye,
Ferenc
