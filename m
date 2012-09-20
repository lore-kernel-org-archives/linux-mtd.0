Received: from switchvoice.com ([77.70.97.103] helo=mail.bioidentic.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TEeAf-00084O-Qj
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 10:39:51 +0000
Message-ID: <00d401cd9719$41e314b0$2901a8c0@dpn>
From: "Dimitar Penev" <dpn@switchfin.org>
To: "Dimitar Penev" <dpn@switchfin.org>,
	<linux-mtd@lists.infradead.org>
References: <006c01cd970c$1b9cb930$2901a8c0@dpn>
Subject: Re: ubiattach  issue
Date: Thu, 20 Sep 2012 13:18:19 +0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
 reply-type=response
Content-Transfer-Encoding: 7bit
Reply-To: Dimitar Penev <dpn@switchfin.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

Bellow the results of few mtd test tools I've tried.

==========================================================
mtd_speedtest: MTD device: 5
mtd_speedtest: MTD device size 511705088, eraseblock size 131072, page size 
2048, count of eraseblocks 3904, pages per eraseblock 64, OOB size 64
mtd_speedtest: scanning for bad eraseblocks
mtd_speedtest: scanned 3904 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 4552 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 2722 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 4517 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 2712 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 4533 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 2715 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 153662 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 292571 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 293258 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 293258 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 294641 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 292571 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 294641 KiB/s
mtd_speedtest: finished
=================================================

=================================================
mtd_pagetest: MTD device: 5
mtd_pagetest: MTD device size 511705088, eraseblock size 131072, page size 
2048, count of eraseblocks 3904, pages per eraseblock 64, OOB size 64
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 3904 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 3904 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: written up to eraseblock 0
mtd_pagetest: written up to eraseblock 256
mtd_pagetest: written up to eraseblock 512
mtd_pagetest: written up to eraseblock 768
mtd_pagetest: written up to eraseblock 1024
mtd_pagetest: written up to eraseblock 1280
mtd_pagetest: written up to eraseblock 1536
mtd_pagetest: written up to eraseblock 1792
mtd_pagetest: written up to eraseblock 2048
mtd_pagetest: written up to eraseblock 2304
mtd_pagetest: written up to eraseblock 2560
mtd_pagetest: written up to eraseblock 2816
mtd_pagetest: written up to eraseblock 3072
mtd_pagetest: written up to eraseblock 3328
mtd_pagetest: written up to eraseblock 3584
mtd_pagetest: written up to eraseblock 3840
mtd_pagetest: written 3904 eraseblocks
mtd_pagetest: verifying all eraseblocks
mtd_pagetest: verified up to eraseblock 0
mtd_pagetest: verified up to eraseblock 256
mtd_pagetest: verified up to eraseblock 512
mtd_pagetest: verified up to eraseblock 768
mtd_pagetest: verified up to eraseblock 1024
mtd_pagetest: verified up to eraseblock 1280
mtd_pagetest: verified up to eraseblock 1536
mtd_pagetest: verified up to eraseblock 1792
mtd_pagetest: verified up to eraseblock 2048
mtd_pagetest: verified up to eraseblock 2304
mtd_pagetest: verified up to eraseblock 2560
mtd_pagetest: verified up to eraseblock 2816
mtd_pagetest: verified up to eraseblock 3072
mtd_pagetest: verified up to eraseblock 3328
mtd_pagetest: verified up to eraseblock 3584
mtd_pagetest: verified up to eraseblock 3840
uncorrectable error :
mtd_pagetest: error: read failed at 0x1e7fd800
uncorrectable error :
mtd_pagetest: error: read failed at 0x1e7fd800
mtd_pagetest: error -74 occurred
=================================================
modprobe: can't load module mtd_pagetest 
(kernel/drivers/mtd/tests/mtd_pagetest.ko): Bad message

Thanks
Dimitar

----- Original Message ----- 
From: "Dimitar Penev" <dpn@switchfin.org>
To: <linux-mtd@lists.infradead.org>
Sent: Thursday, September 20, 2012 11:44 AM
Subject: ubiattach issue


> Hi Gents,
>
> I am facing an issue with ubiattach on Linux kernel 3.0.8
> On our target we have nand flash with mtd layer on top.
> The logs attached below.
>
> Can you please give me a pointer?
>
>
> /bin # ubinfo -a
> UBI version:                    1
> Count of UBI devices:           0
> UBI control device major/minor: 10:62
>
> /bin # ubiformat /dev/mtd5 -y --vid-hdr-offset="2048"
> ubiformat: mtd5 (nand), size 511705088 bytes (488.0 MiB), 3904 eraseblocks 
> of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 3903 -- 100 % complete
> ubiformat: 3904 eraseblocks have valid erase counter, mean value is 3
> ubiformat: formatting eraseblock 3903 -- 100 % complete
>
> /bin # ubiattach /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
> ubiattach: error!: cannot attach mtd5
>           error 25 (Inappropriate ioctl for device)
>
>
> Best Regards
> Dimitar
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
