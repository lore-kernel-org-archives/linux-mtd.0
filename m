Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCpL5-00072U-PQ
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 06:57:32 +0000
Subject: Re: Ubiformat --erase-counter not always used
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DF852EF3@SJEXCHCCR01.corp.ad.broadcom.com>
References: <200911172245.nAHMjnss001994@imap1.linux-foundation.org>
	<1258989544.18407.48.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910DF852EF3@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Nov 2009 08:57:11 +0200
Message-Id: <1259045831.18407.54.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-23 at 10:57 -0800, Darwin Rambo wrote:
> Hello Artem, 
> 
> This is not a bug report, just an observation on ubiformat. It only seems to take the --erase-counter parameter in certain situations. If you have alien data it seems to take it. If the blocks are FF erased or previously formatted correctly it seems to ignore the --erase-counter argument, even though it says it is using it (see below).
> 
> Should we add something in the online help or documentation to explain this better and maybe say in the ubiformat tool itself when the switch is getting used or ignored and why?
> 
> # ./ubiformat /dev/mtd4 -n --erase-counter=1234 -v -y
> ubiformat: mtd4 (NAND), size 2097152 bytes (2.0 MiB), 524288 eraseblocks of 524288 bytes (512.0 KiB), min. I/O size 4096 bytes
> libscan: start scanning eraseblocks 0-4
> libscan: scanning eraseblock 0: alien
> libscan: scanning eraseblock 1: alien
> libscan: scanning eraseblock 2: alien
> libscan: scanning eraseblock 3: alien
> libscan: finished, mean EC 0, 0 OK, 0 corrupted, 0 empty, 4 alien, bad 0
> ubiformat: warning!: 4 of 4 eraseblocks contain non-ubifs data
> ubiformat: use erase counter 1234 for all eraseblocks
> ubiformat: eraseblock 0: erase, write EC 1234
> ubiformat: eraseblock 1: erase, write EC 1234
> ubiformat: eraseblock 2: erase, write EC 1234
> ubiformat: eraseblock 3: erase, write EC 1234
> 192.168.1.105 # ./ubiformat /dev/mtd4 -n --erase-counter=5432 -v -y
> ubiformat: mtd4 (NAND), size 2097152 bytes (2.0 MiB), 524288 eraseblocks of 524288 bytes (512.0 KiB), min. I/O size 4096 bytes
> libscan: start scanning eraseblocks 0-4
> libscan: scanning eraseblock 0: OK, erase counter 1234
> libscan: scanning eraseblock 1: OK, erase counter 1234
> libscan: scanning eraseblock 2: OK, erase counter 1234
> libscan: scanning eraseblock 3: OK, erase counter 1234
> libscan: finished, mean EC 1234, 4 OK, 0 corrupted, 0 empty, 0 alien, bad 0
> ubiformat: 4 eraseblocks have valid erase counter, mean value is 1234
> ubiformat: use erase counter 5432 for all eraseblocks    <------------------ Didn't take this value
> ubiformat: eraseblock 0: erase, write EC 1235
> ubiformat: eraseblock 1: erase, write EC 1235
> ubiformat: eraseblock 2: erase, write EC 1235
> ubiformat: eraseblock 3: erase, write EC 1235 

Looks like a bug to me. I think it should take the EC you ask it in all
cases. I'll look at this when I have a bit more time, thanks for the
report.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
