Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Ayix-0007js-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 20:30:27 +0000
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: "Marc Singer" <elf@buici.com>, linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: crc32() optimization 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sun, 10 Nov 2002 21:05:11 +0100."
             <006901c288f4$79e2ce20$0200a8c0@telia.com>
Date: Sun, 10 Nov 2002 22:00:03 +0100
Message-Id: <20021110210008.7CFF210162@denx.denx.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

In message <006901c288f4$79e2ce20$0200a8c0@telia.com> you wrote:
> 
> What's "Duff's Device"?

It's a tricky way to implement general loop unrolling directly in  C.
Applied  to your problem, code that looks like this (instead of 8 any
other loop count may be used, but  you  need  to  adjust  the  "case"
statements then):

	register int n = (len + (8-1)) / 8;

	switch (len % 8) {
	case 0: do {	val = crc32_table ... ;
	case 7:		val = crc32_table ... ;
	case 6:		val = crc32_table ... ;
	case 5:		val = crc32_table ... ;
	case 4:		val = crc32_table ... ;
	case 3:		val = crc32_table ... ;
	case 2:		val = crc32_table ... ;
	case 1:		val = crc32_table ... ;
		} while (--n > 0);
	}

BTW: this is strictly legal ANSI C!

For an explanation see http://www.lysator.liu.se/c/duffs-device.html

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325 
