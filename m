Received: from cluster-g.mailcontrol.com ([208.87.233.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO80F-0005hg-9V
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 10:34:30 +0000
Received: from rly27g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly27g.srv.mailcontrol.com (MailControl) with ESMTP id
	n67AXsUo008426
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 11:34:20 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly27g.srv.mailcontrol.com (MailControl) id n67AWnJQ031018
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 11:32:49 +0100
Subject: Re: ubiattach problem
From: Oren <oren_s3@VERIFONE.com>
To: dedekind@infradead.org
In-Reply-To: <1246947926.20721.299.camel@localhost.localdomain>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 7 Jul 2009 13:32:41 +0300
Message-ID: <1246962761.1775.7.camel@tlvorens3lnx>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I hope I got the latest mtd-utils.(Download it from git a week ago)
ubiformt -v -- 1.3

I formated the flash with - v option and did not saw ubiformat: write volume table to eraseblocks 0 and 1"?
(See below).

Oren.


On Tue, 2009-07-07 at 09:25 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-07-06 at 21:30 +0300, Oren Sokolowsky wrote:
> > the ubi debug is enable aswell. I do not see anything special.
> > Do i need to do anything else before  ubiattach except ubiformat ? 
> 
> Could you please send it to me anyway?
> 
> Could you please double check you have the latest mtd-utils?
> Could you please provide the output of ubiformat --version ?
> 
> Also, could you please format your flash with the -v ubiformat
> option. Do you see message like:
> "ubiformat: write volume table to eraseblocks 0 and 1"?
> 



cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00020000 "NAND-block1"
mtd1: 01e00000 00020000 "jffs2"
mtd2: 05200000 00020000 "NAND-block2"
ubinfo
UBI version:                    1
Count of UBI devices:           0
UBI control device major/minor: 10:63
ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
ubiformat: mtd0 (nand), size 16777216 bytes (16.0 MiB), 128 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: start scanning eraseblocks 0-128
libscan: scanning eraseblock 0: empty
libscan: scanning eraseblock 1: empty
libscan: scanning eraseblock 2: empty
libscan: scanning eraseblock 3: empty
libscan: scanning eraseblock 4: empty
libscan: scanning eraseblock 5: empty
libscan: scanning eraseblock 6: empty
libscan: scanning eraseblock 7: empty
libscan: scanning eraseblock 8: empty
libscan: scanning eraseblock 9: empty
libscan: scanning eraseblock 10: empty
libscan: scanning eraseblock 11: empty
libscan: scanning eraseblock 12: empty
libscan: scanning eraseblock 13: empty
libscan: scanning eraseblock 14: empty
libscan: scanning eraseblock 15: empty
libscan: scanning eraseblock 16: empty
libscan: scanning eraseblock 17: empty
libscan: scanning eraseblock 18: empty
libscan: scanning eraseblock 19: empty
libscan: scanning eraseblock 20: empty
libscan: scanning eraseblock 21: empty
libscan: scanning eraseblock 22: empty
libscan: scanning eraseblock 23: empty
libscan: scanning eraseblock 24: empty
libscan: scanning eraseblock 25: empty
libscan: scanning eraseblock 26: empty
libscan: scanning eraseblock 27: empty
libscan: scanning eraseblock 28: empty
libscan: scanning eraseblock 29: empty
libscan: scanning eraseblock 30: empty
libscan: scanning eraseblock 31: empty
libscan: scanning eraseblock 32: empty
libscan: scanning eraseblock 33: empty
libscan: scanning eraseblock 34: empty
libscan: scanning eraseblock 35: empty
libscan: scanning eraseblock 36: empty
libscan: scanning eraseblock 37: empty
libscan: scanning eraseblock 38: empty
libscan: scanning eraseblock 39: empty
libscan: scanning eraseblock 40: empty
libscan: scanning eraseblock 41: empty
libscan: scanning eraseblock 42: empty
libscan: scanning eraseblock 43: empty
libscan: scanning eraseblock 44: empty
libscan: scanning eraseblock 45: empty
libscan: scanning eraseblock 46: empty
libscan: scanning eraseblock 47: empty
libscan: scanning eraseblock 48: empty
libscan: scanning eraseblock 49: empty
libscan: scanning eraseblock 50: empty
libscan: scanning eraseblock 51: empty
libscan: scanning eraseblock 52: empty
libscan: scanning eraseblock 53: empty
libscan: scanning eraseblock 54: empty
libscan: scanning eraseblock 55: empty
libscan: scanning eraseblock 56: empty
libscan: scanning eraseblock 57: empty
libscan: scanning eraseblock 58: empty
libscan: scanning eraseblock 59: empty
libscan: scanning eraseblock 60: empty
libscan: scanning eraseblock 61: empty
libscan: scanning eraseblock 62: empty
libscan: scanning eraseblock 63: empty
libscan: scanning eraseblock 64: empty
libscan: scanning eraseblock 65: empty
libscan: scanning eraseblock 66: empty
libscan: scanning eraseblock 67: empty
libscan: scanning eraseblock 68: empty
libscan: scanning eraseblock 69: empty
libscan: scanning eraseblock 70: empty
libscan: scanning eraseblock 71: empty
libscan: scanning eraseblock 72: empty
libscan: scanning eraseblock 73: empty
libscan: scanning eraseblock 74: empty
libscan: scanning eraseblock 75: empty
libscan: scanning eraseblock 76: empty
libscan: scanning eraseblock 77: empty
libscan: scanning eraseblock 78: empty
libscan: scanning eraseblock 79: empty
libscan: scanning eraseblock 80: empty
libscan: scanning eraseblock 81: empty
libscan: scanning eraseblock 82: empty
libscan: scanning eraseblock 83: empty
libscan: scanning eraseblock 84: empty
libscan: scanning eraseblock 85: empty
libscan: scanning eraseblock 86: empty
libscan: scanning eraseblock 87: empty
libscan: scanning eraseblock 88: empty
libscan: scanning eraseblock 89: empty
libscan: scanning eraseblock 90: empty
libscan: scanning eraseblock 91: empty
libscan: scanning eraseblock 92: empty
libscan: scanning eraseblock 93: empty
libscan: scanning eraseblock 94: empty
libscan: scanning eraseblock 95: empty
libscan: scanning eraseblock 96: empty
libscan: scanning eraseblock 97: empty
libscan: scanning eraseblock 98: empty
libscan: scanning eraseblock 99: empty
libscan: scanning eraseblock 100: empty
libscan: scanning eraseblock 101: empty
libscan: scanning eraseblock 102: empty
libscan: scanning eraseblock 103: empty
libscan: scanning eraseblock 104: empty
libscan: scanning eraseblock 105: empty
libscan: scanning eraseblock 106: empty
libscan: scanning eraseblock 107: empty
libscan: scanning eraseblock 108: empty
libscan: scanning eraseblock 109: empty
libscan: scanning eraseblock 110: empty
libscan: scanning eraseblock 111: empty
libscan: scanning eraseblock 112: empty
libscan: scanning eraseblock 113: empty
libscan: scanning eraseblock 114: empty
libscan: scanning eraseblock 115: empty
libscan: scanning eraseblock 116: empty
libscan: scanning eraseblock 117: empty
libscan: scanning eraseblock 118: empty
libscan: scanning eraseblock 119: empty
libscan: scanning eraseblock 120: empty
libscan: scanning eraseblock 121: empty
libscan: scanning eraseblock 122: empty
libscan: scanning eraseblock 123: empty
libscan: scanning eraseblock 124: empty
libscan: scanning eraseblock 125: empty
libscan: scanning eraseblock 126: empty
libscan: scanning eraseblock 127: empty
libscan: finished, mean EC 0, 0 OK, 0 corrupted, 128 empty, 0 alien, bad 0
ubiformat: 128 eraseblocks are supposedly empty
ubiformat: will write 17 eraseblocks
ubiformat: eraseblock 0: erase, change EC to 0, write data
ubiformat: eraseblock 1: erase, change EC to 0, write data
ubiformat: eraseblock 2: erase, change EC to 0, write data
ubiformat: eraseblock 3: erase, change EC to 0, write data
ubiformat: eraseblock 4: erase, change EC to 0, write data
ubiformat: eraseblock 5: erase, change EC to 0, write data
ubiformat: eraseblock 6: erase, change EC to 0, write data
ubiformat: eraseblock 7: erase, change EC to 0, write data
ubiformat: eraseblock 8: erase, change EC to 0, write data
ubiformat: eraseblock 9: erase, change EC to 0, write data
ubiformat: eraseblock 10: erase, change EC to 0, write data
ubiformat: eraseblock 11: erase, change EC to 0, write data
ubiformat: eraseblock 12: erase, change EC to 0, write data
ubiformat: eraseblock 13: erase, change EC to 0, write data
ubiformat: eraseblock 14: erase, change EC to 0, write data
ubiformat: eraseblock 15: erase, change EC to 0, write data
ubiformat: eraseblock 16: erase, change EC to 0, write data
ubiformat: eraseblock 17: erase, write EC 0
ubiformat: eraseblock 18: erase, write EC 0
ubiformat: eraseblock 19: erase, write EC 0
ubiformat: eraseblock 20: erase, write EC 0
ubiformat: eraseblock 21: erase, write EC 0
ubiformat: eraseblock 22: erase, write EC 0
ubiformat: eraseblock 23: erase, write EC 0
ubiformat: eraseblock 24: erase, write EC 0
ubiformat: eraseblock 25: erase, write EC 0
ubiformat: eraseblock 26: erase, write EC 0
ubiformat: eraseblock 27: erase, write EC 0
ubiformat: eraseblock 28: erase, write EC 0
ubiformat: eraseblock 29: erase, write EC 0
ubiformat: eraseblock 30: erase, write EC 0
ubiformat: eraseblock 31: erase, write EC 0
ubiformat: eraseblock 32: erase, write EC 0
ubiformat: eraseblock 33: erase, write EC 0
ubiformat: eraseblock 34: erase, write EC 0
ubiformat: eraseblock 35: erase, write EC 0
ubiformat: eraseblock 36: erase, write EC 0
ubiformat: eraseblock 37: erase, write EC 0
ubiformat: eraseblock 38: erase, write EC 0
ubiformat: eraseblock 39: erase, write EC 0
ubiformat: eraseblock 40: erase, write EC 0
ubiformat: eraseblock 41: erase, write EC 0
ubiformat: eraseblock 42: erase, write EC 0
ubiformat: eraseblock 43: erase, write EC 0
ubiformat: eraseblock 44: erase, write EC 0
ubiformat: eraseblock 45: erase, write EC 0
ubiformat: eraseblock 46: erase, write EC 0
ubiformat: eraseblock 47: erase, write EC 0
ubiformat: eraseblock 48: erase, write EC 0
ubiformat: eraseblock 49: erase, write EC 0
ubiformat: eraseblock 50: erase, write EC 0
ubiformat: eraseblock 51: erase, write EC 0
ubiformat: eraseblock 52: erase, write EC 0
ubiformat: eraseblock 53: erase, write EC 0
ubiformat: eraseblock 54: erase, write EC 0
ubiformat: eraseblock 55: erase, write EC 0
ubiformat: eraseblock 56: erase, write EC 0
ubiformat: eraseblock 57: erase, write EC 0
ubiformat: eraseblock 58: erase, write EC 0
ubiformat: eraseblock 59: erase, write EC 0
ubiformat: eraseblock 60: erase, write EC 0
ubiformat: eraseblock 61: erase, write EC 0
ubiformat: eraseblock 62: erase, write EC 0
ubiformat: eraseblock 63: erase, write EC 0
ubiformat: eraseblock 64: erase, write EC 0
ubiformat: eraseblock 65: erase, write EC 0
ubiformat: eraseblock 66: erase, write EC 0
ubiformat: eraseblock 67: erase, write EC 0
ubiformat: eraseblock 68: erase, write EC 0
ubiformat: eraseblock 69: erase, write EC 0
ubiformat: eraseblock 70: erase, write EC 0
ubiformat: eraseblock 71: erase, write EC 0
ubiformat: eraseblock 72: erase, write EC 0
ubiformat: eraseblock 73: erase, write EC 0
ubiformat: eraseblock 74: erase, write EC 0
ubiformat: eraseblock 75: erase, write EC 0
ubiformat: eraseblock 76: erase, write EC 0
ubiformat: eraseblock 77: erase, write EC 0
ubiformat: eraseblock 78: erase, write EC 0
ubiformat: eraseblock 79: erase, write EC 0
ubiformat: eraseblock 80: erase, write EC 0
ubiformat: eraseblock 81: erase, write EC 0
ubiformat: eraseblock 82: erase, write EC 0
ubiformat: eraseblock 83: erase, write EC 0
ubiformat: eraseblock 84: erase, write EC 0
ubiformat: eraseblock 85: erase, write EC 0
ubiformat: eraseblock 86: erase, write EC 0
ubiformat: eraseblock 87: erase, write EC 0
ubiformat: eraseblock 88: erase, write EC 0
ubiformat: eraseblock 89: erase, write EC 0
ubiformat: eraseblock 90: erase, write EC 0
ubiformat: eraseblock 91: erase, write EC 0
ubiformat: eraseblock 92: erase, write EC 0
ubiformat: eraseblock 93: erase, write EC 0
ubiformat: eraseblock 94: erase, write EC 0
ubiformat: eraseblock 95: erase, write EC 0
ubiformat: eraseblock 96: erase, write EC 0
ubiformat: eraseblock 97: erase, write EC 0
ubiformat: eraseblock 98: erase, write EC 0
ubiformat: eraseblock 99: erase, write EC 0
ubiformat: eraseblock 100: erase, write EC 0
ubiformat: eraseblock 101: erase, write EC 0
ubiformat: eraseblock 102: erase, write EC 0
ubiformat: eraseblock 103: erase, write EC 0
ubiformat: eraseblock 104: erase, write EC 0
ubiformat: eraseblock 105: erase, write EC 0
ubiformat: eraseblock 106: erase, write EC 0
ubiformat: eraseblock 107: erase, write EC 0
ubiformat: eraseblock 108: erase, write EC 0
ubiformat: eraseblock 109: erase, write EC 0
ubiformat: eraseblock 110: erase, write EC 0
ubiformat: eraseblock 111: erase, write EC 0
ubiformat: eraseblock 112: erase, write EC 0
ubiformat: eraseblock 113: erase, write EC 0
ubiformat: eraseblock 114: erase, write EC 0
ubiformat: eraseblock 115: erase, write EC 0
ubiformat: eraseblock 116: erase, write EC 0
ubiformat: eraseblock 117: erase, write EC 0
ubiformat: eraseblock 118: erase, write EC 0
ubiformat: eraseblock 119: erase, write EC 0
ubiformat: eraseblock 120: erase, write EC 0
ubiformat: eraseblock 121: erase, write EC 0
ubiformat: eraseblock 122: erase, write EC 0
ubiformat: eraseblock 123: erase, write EC 0
ubiformat: eraseblock 124: erase, write EC 0
ubiformat: eraseblock 125: erase, write EC 0
ubiformat: eraseblock 126: erase, write EC 0
ubiformat: eraseblock 127: erase, write EC 0
ubiattach /dev/ubi_ctrl -m 0
[42949469.960000] UBI error: ubi_read_volume_table: the layout volume was not found
[42949469.970000] UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
ubiattach: error!: cannot attach mtd0
           error 22 (Invalid argument)
