Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCe6p-0003fC-32
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 18:58:06 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 23 Nov 2009 10:57:40 -0800
Subject: Ubiformat --erase-counter not always used
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DF852EF3@SJEXCHCCR01.corp.ad.broadcom.com>
References: <200911172245.nAHMjnss001994@imap1.linux-foundation.org>
	<1258989544.18407.48.camel@localhost>
In-Reply-To: <1258989544.18407.48.camel@localhost>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,=20

This is not a bug report, just an observation on ubiformat. It only seems t=
o take the --erase-counter parameter in certain situations. If you have ali=
en data it seems to take it. If the blocks are FF erased or previously form=
atted correctly it seems to ignore the --erase-counter argument, even thoug=
h it says it is using it (see below).

Should we add something in the online help or documentation to explain this=
 better and maybe say in the ubiformat tool itself when the switch is getti=
ng used or ignored and why?

# ./ubiformat /dev/mtd4 -n --erase-counter=3D1234 -v -y
ubiformat: mtd4 (NAND), size 2097152 bytes (2.0 MiB), 524288 eraseblocks of=
 524288 bytes (512.0 KiB), min. I/O size 4096 bytes
libscan: start scanning eraseblocks 0-4
libscan: scanning eraseblock 0: alien
libscan: scanning eraseblock 1: alien
libscan: scanning eraseblock 2: alien
libscan: scanning eraseblock 3: alien
libscan: finished, mean EC 0, 0 OK, 0 corrupted, 0 empty, 4 alien, bad 0
ubiformat: warning!: 4 of 4 eraseblocks contain non-ubifs data
ubiformat: use erase counter 1234 for all eraseblocks
ubiformat: eraseblock 0: erase, write EC 1234
ubiformat: eraseblock 1: erase, write EC 1234
ubiformat: eraseblock 2: erase, write EC 1234
ubiformat: eraseblock 3: erase, write EC 1234
192.168.1.105 # ./ubiformat /dev/mtd4 -n --erase-counter=3D5432 -v -y
ubiformat: mtd4 (NAND), size 2097152 bytes (2.0 MiB), 524288 eraseblocks of=
 524288 bytes (512.0 KiB), min. I/O size 4096 bytes
libscan: start scanning eraseblocks 0-4
libscan: scanning eraseblock 0: OK, erase counter 1234
libscan: scanning eraseblock 1: OK, erase counter 1234
libscan: scanning eraseblock 2: OK, erase counter 1234
libscan: scanning eraseblock 3: OK, erase counter 1234
libscan: finished, mean EC 1234, 4 OK, 0 corrupted, 0 empty, 0 alien, bad 0
ubiformat: 4 eraseblocks have valid erase counter, mean value is 1234
ubiformat: use erase counter 5432 for all eraseblocks    <-----------------=
- Didn't take this value
ubiformat: eraseblock 0: erase, write EC 1235
ubiformat: eraseblock 1: erase, write EC 1235
ubiformat: eraseblock 2: erase, write EC 1235
ubiformat: eraseblock 3: erase, write EC 1235=20

Thanks.

Regards,
Darwin
