Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Za5k-0008Jb-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2001 16:38:54 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-24 #47347)
 id <0GIH002017QFHV@asu.edu> for linux-mtd@lists.infradead.org; Wed,
 22 Aug 2001 08:44:39 -0700 (MST)
Date: Wed, 22 Aug 2001 08:44:52 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: mkfs.jffs2
In-reply-to: <3B841D7B.2D9FD324@sasken.com>
To: Ashok M Padmanaban <ashokmp@sasken.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>,
 JFFS mailing list <jffs-dev@axis.com>
Message-id: <998495092.14171.0.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <3B841D7B.2D9FD324@sasken.com>
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

On 22 Aug 2001 21:00:43 +0000, Ashok M Padmanaban wrote:
> Hi,
>   The mkfs.jffs2 has some options,  in which  -e option specifies the
> erase block size, which  by default is 64KiB.
> While making a jffs2 image of a directory (which has some files) of size
> 3848192 Bytes.
> 
>  ./mkfs.jffs2   -d directory   -o jffs2_img  -e  128KiB
> 
> With default option for erase block size ( 64KiB), the jffs2 image size
> was :   1983612 Bytes. ( 1.89 MB)
>  With   -e 128KiB
> , the jffs2 image size was :    7687900 Bytes  (7.33 MB)
>   With   -e  256KiB
> , the jffs2 image size was :    4289164 Bytes   (4.09 MB)
> 
> Why is that the jffs2 image size is varying with the erase block size.?
>  If i have an erase size of 256KiB(on flash), is it necessary that i
> should build a jffs2 image with the -e 256KiB option.

try -e 0x20000 or -e 0x10000
