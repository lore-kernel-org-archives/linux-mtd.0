Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITDoP-0003Nz-ES
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 05:38:13 -0400
Date: Thu, 6 Sep 2007 11:37:35 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Re: General performance of NAND operations i.e mount and ls
Message-ID: <20070906093735.GD2164@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1189069864.14370.34.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2007-09-06 12:11 +0300 schrieb Artem Bityutskiy:

> Try to measure raw R/W, e.g with dd. But beware dd will fail at the
> first met bad block. Something like:

Okay, what would I roughly excpect on this system?

# time dd if=/dev/mtd4 of=/dev/null bs=4096 count=512
512+0 records in
512+0 records out
real    0m 0.61s
user    0m 0.01s
sys     0m 0.61s
# time dd if=/dev/zero of=/dev/mtd4 bs=4096 count=512
512+0 records in
512+0 records out
real    0m 1.08s
user    0m 0.00s
sys     0m 1.08s

Meanwhile I played around with 2.6.23-rc3:

modprobe ubi mtd=4:

UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 0:512,
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 1:512,
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 2:512,
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 3:512,
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 4:512,
written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 5:512,
written 0 bytes
UBI warning: io_init: EC and VID headers are in the same minimal I/O
unit, switch to read-only mode
UBI error: validate_ec_hdr: bad VID header offset 512, expected 128
UBI error: validate_ec_hdr: bad EC header
UBI error: ubi_io_read_ec_hdr: validation failed for PEB 0

Konsti

PS.: does anybody know where the IRQs have gone?
2.6.20:
eth0: dm9000 at c8850000,c8852004 IRQ 133 MAC: 00:0c:7f:01:23:47
2.6.23-rc3:
eth0: dm9000 at c8878000,c887a004 IRQ 165 MAC: 00:0c:7f:01:23:47
Both cases on GPIO101

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
