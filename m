Received: from [212.18.228.66] (helo=mail.linuxgrrls.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEmq7-0004dH-A4
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 09:42:07 +0000
Message-ID: <50335.192.91.75.30.1067420411.squirrel@mail.linuxgrrls.org>
In-Reply-To: <1067388508.17740.9.camel@imladris.demon.co.uk>
References: <3F9D3D98.6453.14E703@localhost>
    <20031027202807.DA4481A0A7@desire.actrix.co.nz>
    <1067339503.15551.429.camel@hades.cambridge.redhat.com>
    <20031028232658.9B8854414@blood.actrix.co.nz>
    <1067388508.17740.9.camel@imladris.demon.co.uk>
Date: Wed, 29 Oct 2003 09:40:11 -0000 (GMT)
From: "Jasmine Strong" <jasmine@linuxgrrls.org>
To: "David Woodhouse" <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
Subject: Re: SmartMedia FAT
Reply-To: jasmine@linuxgrrls.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> [NAND]
>
> Can't you just hang one off the parallel port and bitbang it? Should be
> fairly trivial to make a driver which uses the generic NAND code and
> does that.... left as an exercise for the reader with a soldering iron.

...in fact, this is very nearly what we did on the ZL103xx NAND
driver.  Rob, are you out there?

-Jasmine.
