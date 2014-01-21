Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5dLn-00014m-Cs
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 15:34:51 +0000
Received: by mail-ie0-f176.google.com with SMTP id tp5so3543709ieb.7
 for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2014 07:34:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFrvcAqcORcdHr14hnrTVCREOYsU9+=CFM8556sNgPihm67aUQ@mail.gmail.com>
References: <CAFrvcAqcORcdHr14hnrTVCREOYsU9+=CFM8556sNgPihm67aUQ@mail.gmail.com>
Date: Tue, 21 Jan 2014 07:34:30 -0800
Message-ID: <CAFrvcArfGsF2UK169_ZjvxhgsrygSLcMVJnp1qeML+nnG2207Q@mail.gmail.com>
Subject: Re: Linux 3.10.24 Oops with Freescale MTD_NAND_FSL_ELBC
From: Barry G <mr.scada@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 17, 2014 at 10:08 AM, Barry G <mr.scada@gmail.com> wrote:

> LR [c01cb430] nand_write_subpage_hwecc+0x6c/0x16c

I bisected down the issue and the commit that breaks our system is:
837a6ba4f - mtd: nand: subpage write support for hardware based ECC schemes

The problem is nand_write_subpage_hwecc gets called, but ecc.hwctl
and ecc.calculate are NULL since they aren't setup in the fsl_elbc_nand
driver (or anywhere else).

My 8308 has the DECC in the BR configured as binary 10 - ECC checking and
generation are enabled for FCM on full-page transfers.  There isn't
a setting for sub-page ECC.

A correct and working version of the kernel reports:
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: max. sequence number:       689932
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "ubi"
UBI: MTD device size:            512 MiB
UBI: number of good PEBs:        4089
UBI: number of bad PEBs:         7
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     2
UBI: available PEBs:             61
UBI: total number of reserved PEBs: 4028
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 239/169
UBI: image sequence number:  -80103396
UBI: background thread "ubi_bgt0d" started, PID 191


Failed Workarounds I tried:
I tried setting options = NAND_NO_SUBPAGE_WRITE but that results in:
UBI: attaching mtd1 to ubi0
UBI error: validate_ec_hdr: bad VID header offset 512, expected 2048
UBI error: validate_ec_hdr: bad EC header

Futher forcing everything to 512 offset (ubi=1,512) results in:
UBI warning: io_init: EC and VID headers are in the same minimal I/O
unit, switch to read-only mode

Successful Workarounds:
Backing out 837a6ba4f "fixes" it and allows my system to boot on v3.10.24.

Not sure how best to proceed.

Thanks for the help,

Barry
