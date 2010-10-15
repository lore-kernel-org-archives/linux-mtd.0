Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6dbU-0001uA-U5
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 06:17:26 +0000
Received: by bwz7 with SMTP id 7so1251033bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2010 23:17:07 -0700 (PDT)
Subject: Re: Latest mkfs.jffs2 is broken.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B02708426976450C42B27@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B02708426976450C42B27@AUSP01VMBX24.collaborationhost.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Oct 2010 09:14:05 +0300
Message-ID: <1287123245.18576.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-14 at 16:54 -0500, H Hartley Sweeten wrote:
> Hello all,
> 
> Buildroot recently bumped the mtd-utils package from version 1.3.1 to 1.4.0.
> 
> With the mkfs.jffs2 utility in 1.3.1 I am able to create rootfs.jffs images that
> work fine on my i.mx35 arm system.  But, with the 1.4.0 version all the images
> do not work.
> 
> With the 1.4.0 built images I get messages like this during the kernel boot:
> 
> jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x813c6fd8 (calculated 0xe41eb0b1)
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x000c instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x6fd8 instead
> jffs2_scan_eraseblock(): Node at 0x0000000c {0x1985, 0xe001, 0x0000002b) has invalid CRC 0x1804b18f (calculated 0x7d266ee6)
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010: 0x002b instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0xb18f instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0x0001 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x0002 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x1a8d instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028: 0x0403 instead
> Further such events for this erase block will not be printed
> Old JFFS2 bitmask found at 0x00000078
> You cannot use older JFFS2 filesystems with newer kernels
> Empty flash at 0x0000a46c ends at 0x0000a470
> 
> And, if I check the images with jffs2dump I get stuff like:
> 
> Wrong hdr_crc  at  0x0001f808, 0x783f44d2 instead of 0x1d1d9bbb
> Wrong bitmask  at  0x0001f80c, 0x07f3
> Empty space found from 0x0001fffc to 0x00020000
> 
> Any ideas what could be wrong with the 1.4.0 release?

Could you please bisect the mtd-utils.git tree and find the offending
commit.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
