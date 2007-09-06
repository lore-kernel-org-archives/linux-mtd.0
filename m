Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITJqK-0008R1-An
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 12:04:36 -0400
Date: Thu, 6 Sep 2007 18:03:57 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Re: General performance of NAND operations i.e mount and ls
Message-ID: <20070906160357.GG2164@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron>
	<1189077119.14370.52.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1189077119.14370.52.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2007-09-06 14:11 +0300 schrieb Artem Bityutskiy:

> may you please go to Device Drivers--->Memory Technology Device (MTD)
> support--->UBI - Unsorted block images---> in menuconfig and enable "UBI
> debugging", "UBI debugging messages", and "Extra self-checks" and try
> again? Then send what UBI prints. I'll try to figure out what is wrong.

Well after half an hour I got this:

UBI DBG: attach_mtd_dev: attaching mtd4 to ubi0: VID header offset 0 data offset 0
UBI DBG: io_init: min_io_size      2048
UBI DBG: io_init: hdrs_min_io_size 512
UBI DBG: io_init: ec_hdr_alsize    512
UBI DBG: io_init: vid_hdr_alsize   512
UBI DBG: io_init: vid_hdr_offset   512
UBI DBG: io_init: vid_hdr_aloffset 512
UBI DBG: io_init: vid_hdr_shift    0
UBI DBG: io_init: leb_start        2048
UBI DBG: io_init: leb_size         129024
UBI DBG: io_init: ro_mode          0
UBI DBG: ubi_scan: scanning is finished
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 0:512, written 0 bytes
Function entered at [<c001df40>] from [<bf0528a0>]
Function entered at [<bf052694>] from [<bf052994>]
Function entered at [<bf0528c8>] from [<bf04b67c>]
 r6:00000100 r5:00000000 r4:00000001
Function entered at [<bf04b448>] from [<bf04b9c4>]
Function entered at [<bf04b8b0>] from [<bf06163c>]
Function entered at [<bf06120c>] from [<c004dc44>]
Function entered at [<c004cb40>] from [<c0019f40>]
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 1:512, written 0 bytes
Function entered at [<c001df40>] from [<bf0528a0>]
Function entered at [<bf052694>] from [<bf052994>]
Function entered at [<bf0528c8>] from [<bf04b67c>]
 r6:00000200 r5:00000000 r4:00000002
Function entered at [<bf04b448>] from [<bf04b9c4>]
Function entered at [<bf04b8b0>] from [<bf06163c>]
Function entered at [<bf06120c>] from [<c004dc44>]
Function entered at [<c004cb40>] from [<c0019f40>]
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 2:512, written 0 bytes
Function entered at [<c001df40>] from [<bf0528a0>]
Function entered at [<bf052694>] from [<bf052994>]
Function entered at [<bf0528c8>] from [<bf04b67c>]
 r6:00000300 r5:00000000 r4:00000003
Function entered at [<bf04b448>] from [<bf04b9c4>]
Function entered at [<bf04b8b0>] from [<bf06163c>]
Function entered at [<bf06120c>] from [<c004dc44>]
Function entered at [<c004cb40>] from [<c0019f40>]
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 3:512, written 0 bytes
Function entered at [<c001df40>] from [<bf0528a0>]
Function entered at [<bf052694>] from [<bf052994>]
Function entered at [<bf0528c8>] from [<bf04b67c>]
 r6:00000400 r5:00000000 r4:00000004
Function entered at [<bf04b448>] from [<bf04b9c4>]
Function entered at [<bf04b8b0>] from [<bf06163c>]
Function entered at [<bf06120c>] from [<c004dc44>]
Function entered at [<c004cb40>] from [<c0019f40>]
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 4:512, written 0 bytes
Function entered at [<c001df40>] from [<bf0528a0>]
Function entered at [<bf052694>] from [<bf052994>]
Function entered at [<bf0528c8>] from [<bf04b67c>]
 r6:00000500 r5:00000000 r4:00000005
Function entered at [<bf04b448>] from [<bf04b9c4>]
Function entered at [<bf04b8b0>] from [<bf06163c>]
Function entered at [<bf06120c>] from [<c004dc44>]
Function entered at [<c004cb40>] from [<c0019f40>]
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 5:512, written 0 bytes
Function entered at [<c001df40>] from [<bf0528a0>]
Function entered at [<bf052694>] from [<bf052994>]
Function entered at [<bf0528c8>] from [<bf04b67c>]
 r6:00000600 r5:00000000 r4:00000006
Function entered at [<bf04b448>] from [<bf04b9c4>]
Function entered at [<bf04b8b0>] from [<bf06163c>]
Function entered at [<bf06120c>] from [<c004dc44>]
Function entered at [<c004cb40>] from [<c0019f40>]
UBI error: attach_mtd_dev: failed to attach by scanning, error -5

To not flood the console/kernlog I disabled

#warning KKK
// KKK          dbg_msg("process PEB %d", pnum);

though.

Kind regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
