Received: from [62.254.209.121] (helo=drmail.stives.linx.gbr)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Evw3i-0001YH-7F
	for linux-mtd@lists.infradead.org; Mon, 09 Jan 2006 07:23:41 -0500
Message-ID: <DB1B6B12D0E2F0469EB35A9586066B6ECE7982@stivesemail.stives.linx.gbr>
From: James Hughes <JHughes@Linx.co.uk>
To: "MTD List (E-mail)" <linux-mtd@lists.infradead.org>
Date: Mon, 9 Jan 2006 12:27:02 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Driver not probing flash for some reason?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

another probably dumb question, but I am a bit stumped.

Using 2.6.10 kernel

I have compiled in a map driver which has the locations of the flash on my
Sophia Systems SandgateII board. It is definitely getting registered
according to debug messages, however, the probe function is apparently never
called (the printk gives no output).

I have redboot partition table parsing turned on (tried with off, no
change).

Is there something I have failed to set in my kernel config that is stopping
the probe being done, and the flash being found? Or something else? Any
ideas?

James
