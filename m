Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7wse-0003e6-DF
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 11:09:37 -0400
Message-ID: <430C8DB9.3030803@inf.u-szeged.hu>
Date: Wed, 24 Aug 2005 17:09:45 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Suresh K <sureshkanniappan@gmail.com>
References: <802ad8b60508222243345b5e18@mail.gmail.com>	
	<802ad8b60508230349683751c6@mail.gmail.com>	
	<430B1B29.2010004@inf.u-szeged.hu>
	<802ad8b60508240052462d2d5c@mail.gmail.com>
In-Reply-To: <802ad8b60508240052462d2d5c@mail.gmail.com>
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

Suresh K wrote:

>>Can you send me more information about it? For example kernel log with
>>debug level 1. And please make sure that you use the latest mtd            > snapshot
>>with newest summary patch - use only erase block summary, centralized
>>summary is now under construction.
>>    
>>
>
>   Initially I have used the EBS patch and mtd-snapshots released on
>11/08/2005. I faced the segmentation fault issue with this patches
>used in 2.6.10 kernel.
>
>   Today I have downloaded the latest EBS patch and mtd-snapshot
>released on 23/08/2005 from the below sites
>
>   http://www.inf.u-szeged.hu/jffs2/mount.php - EBS patch
>   ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/ - MTD 23/08/05
>
>Applied the EBS patches to JFFS2 utilities in MTD snapshots, patched
>the 2.6.10 kernel with the command /mtd/kernelpatch.sh -2
>/usr/src/linux-2.6.10.
>Created the jffs2 image with new mkfs.jffs2 utility. Created the jffs2
>image with sumtool utility. Mounted the same. Copied the 1.5MB file to
>JFFS2 partition, still i faced the Segmentation fault issue. The
>following are the debug messages posted by the kernel.
>
>/dev/hdc13 (120MB) - jffs2 image created by mkfs.jffs2 utility
>/dev/hdc14 (120MB) - jffs2 image created with sumtool utility after
>mkfs.jffs2 utility.
>
>Only 472K of 1.5MB file is copied into the JFFS2 partition in both the
>cases. This is FYI.
>
>-----------------------------Kernel Message Starts----------------------------
>blkmtd: version $Revision: 1.26 $
>blkmtd: mtd0: [/dev/hda14] erase_size = 256KiB 
>JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2003 Red Hat, Inc.
>jffs2: Flash size not aligned to erasesize, reducing to 128256KiB
>JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!
>------------[ cut here ]------------
>kernel BUG at fs/jffs2/summary.c:661!
>  
>
It is too few information for me. Please use JFFS2 debug level 1, and
send me the full kernel log. If possible use the summary patch of today
(24th), I've added some additional debug message, which can be very
usefull to debug your problem.

Some other question/idea: did you try it without summary? Did it work
correctly? (Peter Grayson reported a problem using the current snapshot,
it also maybe related by that). You also may try compile 2.6.x without
preemtion and SMP. I would be good to know that it works or not, I may
be the difference between 2.4.x and 2.6.x.

Bye,
Ferenc
