Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lgwso-0006Gs-U0
	for linux-mtd@lists.infradead.org; Tue, 10 Mar 2009 08:00:18 +0000
Message-ID: <49B61E00.5070102@nokia.com>
Date: Tue, 10 Mar 2009 10:00:00 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Subramani Venkatesh <subbu31mani@gmail.com>
Subject: Re: UBIFS mounting error
References: <25dd9bf10903091456v2a2d60e6x1759351476fe6536@mail.gmail.com>
In-Reply-To: <25dd9bf10903091456v2a2d60e6x1759351476fe6536@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Subramani Venkatesh wrote:
> Hi
> I am trying to mount UBIFS on NAND flash, I am quite often getting the
> error below after rebooting.
> 
> UBIFS: recovery needed
> UBI error: ubi_io_write: error -5 while writing 2048 bytes to PEB
> 0:4096, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write 2048 bytes at offset 0
> of LEB 0:4, PEB 0
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 1:2048, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:4, PEB 1
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 2:2048, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:4, PEB 2
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 11:2048, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:4, PEB 11
> UBI warning: ubi_ro_mode: switch to read-only mode
> 
> I created UBIFS image for 400MiB volume
> 
> ./mkfs.ubifs -r target -m 2KiB -e 124KiB -c 3164 -o ti-ubifs.img
> ./ubinize -o ti-flash.img -m 2048 -p 128KiB -s 2048 ubinize-ti.cfg
> 
> and the config file is
> 
> [ubifs]
> mode=ubi
> image=ti-ubifs.img
> vol_id=0
> vol_size=392448KiB
> vol_type=dynamic
> vol_name=rootfs
> vol_flags=autoresize
> 
> I am getting above error only after rebooting.
> 
> I have software ecc for 512 bytes.
> Though I have 512 bytes of sub-page, I forced it to 2048 Bytes,
> considering no sub-page.

Well the errors above show UBI writing 512 bytes, so UBI is still
using subpages. See:

http://linux-mtd.infradead.org/faq/ubi.html#L_force_no_subpage

> 
> Can anyone guide why I am getting above error after rebooting for
> autoresize and dynamic volume.


What did you use to write the image?

Have you tried the NAND tests on your NAND driver?

http://git.infradead.org/mtd-2.6.git?a=tree;f=drivers/mtd/tests;h=25367d2dfba53d5f36bea2865aa4acef149f5a8c;hb=HEAD

I suggest you try the page test and subpage test at least.
