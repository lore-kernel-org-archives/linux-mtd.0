Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FDI9m-0007QD-Rb
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2006 04:25:47 -0500
Message-ID: <44017402.6030405@intel.com>
Date: Sun, 26 Feb 2006 12:25:22 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Kein Yuan <kein.yuan@gmail.com>, linux-mtd@lists.infradead.org
References: <d0cf8c90602240714g69b0bcf5y47dba43e25fb139c@mail.gmail.com>
In-Reply-To: <d0cf8c90602240714g69b0bcf5y47dba43e25fb139c@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: Strange problem with JFFS2/MTD on Linux 2.6.9 ith Intel J3 Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kein Yuan wrote:

> I am working on a PXA270 based paltform with Intel J3 Flash on Linux
> 2.6.9.  I am sure that jffs2 image was written into the correct place
> and verified by md5chk command in blob, but somehow kernel can detect
> flash, can dump out the context correctly but failed to mount  the
> flash partition as my root filesystem.  Can anybody here give me some
> hints?    The boot log was pasted as below:
>
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00037ef4:
> 0x9f54 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003f070:
> 0xf960 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
> 0x085c instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
> 0x1860 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000d2bb4:
> 0x0001 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0012a370:
> 0x006e instead
>
It possible that you specified erase block size improperly when you 
created image of JFFS2 file system. Size of erase block can be specified 
through -e parameter of mkfs.jffs2 utility.
Erase block size can be obtained using blob. (On attmempt to write 
something blob should display size of erase block)

Thanks,
Alexey
