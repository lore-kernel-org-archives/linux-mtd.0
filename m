Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H6prj-0005nP-Tv
	for linux-mtd@lists.infradead.org; Tue, 16 Jan 2007 10:04:50 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l0GF4GHp011827
	for <linux-mtd@lists.infradead.org>; Tue, 16 Jan 2007 16:04:16 +0100
Date: Tue, 16 Jan 2007 16:05:12 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: __user removed from mtd-abi.h
In-Reply-To: <1168948907.3439.3.camel@shinybook.infradead.org>
Message-ID: <Pine.LNX.4.64.0701161603230.11369@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0701160805030.11369@lnxricardw.se.axis.com>
	<1168948907.3439.3.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 16 Jan 2007, David Woodhouse wrote:

> It _isn't_ defined. We automatically strip it out from the headers we
> install...
>
> shinybook /shiny/git/linux-2.6 $ make INSTALL_HDR_PATH=3D/tmp/foo headers=
_install >/dev/null
> ...

Ah, thanks. I'd missed the whole (new) headers_install stuff ...

Sorry for the misdirected allegations.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
