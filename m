Received: from mx0b-00176a03.pphosted.com ([67.231.157.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXwH6-0005Rc-8l
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 18:31:33 +0000
Received: from pps.filterd (m0048299.ppops.net [127.0.0.1])
 by m0048299.ppops.net-00176a03. (8.14.7/8.14.7) with SMTP id t2HIKXVo007400
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2015 14:31:06 -0400
Received: from alpmlip13.e2k.ad.ge.com (n165-156-000-000.static.ge.com
 [165.156.5.1] (may be forged))
 by m0048299.ppops.net-00176a03. with ESMTP id 1t6s4h00nj-9
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2015 14:31:06 -0400
Received: from [3.26.68.149] (unknown [3.26.68.149])
 by selma.edi.geip.ge.com (Postfix) with ESMTP id 2D44FE1893
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2015 18:31:02 +0000 (GMT)
Message-ID: <550872E5.7040106@ge.com>
Date: Tue, 17 Mar 2015 18:31:01 +0000
From: Renaud Barbier <renaud.barbier@ge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBI/UBIFS: debugging help
References: <5503285A.5090500@ge.com>
In-Reply-To: <5503285A.5090500@ge.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 I have added debug messages in the Linux UBIFS driver (I am using Linux
3.14) and noticed as well that read_block returns -ENOENT several times
toward the end of the copy of a file (512KB). Though, the Linux system
is able to read the whole file correctly (checksum is correct).

The boot loader however bails out on error.

The read_block  issue disappears if I delete, copy it back and remount
the UBIFS file system.

Below is the way I create the UBI image before formatting the SPI-nor:
# mkfs.ubifs -vv -F -d boot -m 1 -e 65408 -c 380  -U -x lzo -o boot.img
# ubinize -v -o test3_nor.img -p 64KiB -m 1 ubinize.cfg

with ubinize.cfg:
# Section header
[boot]
mode=ubi
# Source image
image=boot.img
# Volume ID in UBI image
vol_id=0
# Volume size
vol_size=25MiB
# Allow for static resize
vol_type=dynamic
# Volume name
vol_name=boot

So in summary, if I ubiformat the partition from Linux with a ubi image,
the Linux UBIFS driver function read_block returns ENOENT during file
copy and it completes.
However, if I copy a file to the UBIFS partition and read back after
re-mounting there is no issue.

Would somebody know whether the parameters to mkfs.ubifs and ubinize
have anything to do with read_block failing?

I created UBI images before for a flash with 128KB sectors and not seen
this problem.

Cheers.


On 13/03/2015 18:11, Renaud Barbier wrote:
> My platform is based on a ARM Cortex-A9 and boots barebox from a spi-nor.
> 
> I have tested UBI/UBIFS from Linux on this platform with no issue after
> disabling 4KB support for the spi nor I am using.
> 
> However, I got problem on the boot loader side. UBI/UBIFS has been
> ported by the barebox community from Linux and I used it successfully
> on a previous project on a PPC platform.
> 
> On the ARM platform I can ubiattach, mount the mtd partition and copy a
> small file (~65KB spanning two sectors). The issue comes when I copy out
> a larger file (512KB) out. It fails to copy the whole file.
> 
> At the point of failure, ubifs_tnc_locate fails resulting in the
> function read_block to return -ENOENT.
> 
> Debugging shows that in the function ubifs_search_zbranch no keys match
> is found prior to the failure.
> 
> I know this list is called linux-mtd but I was hoping that somebody
> could give me a pointer on where to look next. I am currently going
> through git logs and mailing list.
> 
> I am pretty confident the boot loader spi driver is working properly as
> raw write-read-compare have not failed.
> 
> cheers.
> 
> 
> 
> 
> 
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
