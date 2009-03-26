Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lmruf-0007NE-KR
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 15:54:44 +0000
Date: Thu, 26 Mar 2009 16:54:21 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
In-Reply-To: <20090326154142.GA15963@Chamillionaire.breakpoint.cc>
Message-ID: <Pine.LNX.4.64.0903261650100.9213@lnxricardw.se.axis.com>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 26 Mar 2009, Sebastian Andrzej Siewior wrote:

> I'm sorry. That is actually my point. The layout of the cleanmarker=20
> (which are used only by JFFS2) depends on a specific kernel switch in=20
> case of NOR flash which is not BIT_WRITEABLE and userland can't know=20
> that. I've sent a patch to remove the -j option because the generated=20
> cleanmaker *may* be wrong. Artem replied that he would like to see this=
=20
> fixed. So here is an attempt to fix this: black listed ubi & data flash=
=20
> but I dunno how fix the NOR case where does not have BIT_WRITEABLE bit.=
=20
> A commandline switch for those who know what they do? Why don't rip out=
=20
> -j and let the kernel create clean marker if it needs it?

There can be a performance benefit to having the image contain=20
cleanmarkers rather than the kernel having to do it. Specifically, if a=20
cleanmarker is missing, the kernel doesn't know if it's because it's a=20
virgin image or because a previous erase failed (typically because of a=20
power fail during erase). In the case of a failed erase, the sector might=
=20
not be properly erased (i.e. even though the bytes might read 0xFF they=20
might not be properly erase, resulting in spurious bitflips later). So,=20
the kernel must erase the sector (which for a NOR flash is a slow=20
operation) before writing the cleanmarker.

For a given application it may be possible to skip the=20
erase-before-writing-cleanmarker, but in the general case it is necessary,=
=20
which slows system startup (the flash cannot be used while it is being=20
erased).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
