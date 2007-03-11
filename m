Received: from pasmtpb.tele.dk ([80.160.77.98])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQUHY-0004TV-Cv
	for linux-mtd@lists.infradead.org; Sun, 11 Mar 2007 16:04:49 -0400
Date: Sun, 11 Mar 2007 21:05:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-mtd@lists.infradead.org, joern@lazybastard.org
Subject: MTD_PHRAM - what filesystem to use?
Message-ID: <20070311200508.GA3362@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: sam@ravnborg.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jörn and other MTD folks.

At my new job we are planning to start usign a ARM9 based
design where we need to store data persistently.

Since the data are updated several times / minute the FLASH
devices are not suitable and therefore alternative solutions
are being looked at.

The most promising solutions semms to use battery
backed-up RAM.
>From Linux we could memorymap this area but using a filesystem
gives all sorts of extra bonusses so this is preferred.

I looked shortly at PRAMFS that seems to do the trick but PRMFS
seems unmaintained and not merged.
Then I stumbled over PHRAM.
I and pretty clear upon the basic parts lettign the RAM look
like any other FLASH device.
But then the question popped up.

What is the best filesystem to use on top of a PHRAM based
MTD device?
My first two ideas were to use either JFFS2 or ext2
(the latter with the blocklayer emulation).
But reading the documentation both looks like overkill.

The requirement so far is to gain maximum bebefit of the
avalable 100 kbytes of RAM.
There will be a limited number of files (< 500).

Any inputs?

	Sam
