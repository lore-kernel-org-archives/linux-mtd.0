Received: from mx0b-00176a03.pphosted.com ([67.231.157.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWU48-00020W-W0
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 18:12:09 +0000
Received: from pps.filterd (m0048299.ppops.net [127.0.0.1])
 by m0048299.ppops.net-00176a03. (8.14.7/8.14.7) with SMTP id t2DIAW18000406
 for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2015 14:11:46 -0400
Received: from alpmlip12.e2k.ad.ge.com (n165-156-000-000.static.ge.com
 [165.156.5.1] (may be forged))
 by m0048299.ppops.net-00176a03. with ESMTP id 1t44tcg06d-19
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2015 14:11:46 -0400
Received: from [3.26.68.149] (unknown [3.26.68.149])
 by selma.edi.geip.ge.com (Postfix) with ESMTP id 3A3D3E0D53
 for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2015 18:11:38 +0000 (GMT)
Message-ID: <5503285A.5090500@ge.com>
Date: Fri, 13 Mar 2015 18:11:38 +0000
From: Renaud Barbier <renaud.barbier@ge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI/UBIFS: debugging help
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My platform is based on a ARM Cortex-A9 and boots barebox from a spi-nor.

I have tested UBI/UBIFS from Linux on this platform with no issue after
disabling 4KB support for the spi nor I am using.

However, I got problem on the boot loader side. UBI/UBIFS has been
ported by the barebox community from Linux and I used it successfully
on a previous project on a PPC platform.

On the ARM platform I can ubiattach, mount the mtd partition and copy a
small file (~65KB spanning two sectors). The issue comes when I copy out
a larger file (512KB) out. It fails to copy the whole file.

At the point of failure, ubifs_tnc_locate fails resulting in the
function read_block to return -ENOENT.

Debugging shows that in the function ubifs_search_zbranch no keys match
is found prior to the failure.

I know this list is called linux-mtd but I was hoping that somebody
could give me a pointer on where to look next. I am currently going
through git logs and mailing list.

I am pretty confident the boot loader spi driver is working properly as
raw write-read-compare have not failed.

cheers.
