Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga5PR-0005XU-AB
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 03:00:24 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9I708P1000858
	for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2006 09:00:08 +0200
Date: Wed, 18 Oct 2006 09:01:24 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] [MTD] [CORE]: Fix MEMGETOOBSEL and ECCGETLAYOUT ioctls
In-Reply-To: <1161099911.3260.97.camel@sauron>
Message-ID: <Pine.LNX.4.64.0610180859020.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171720200.25906@lnxricardw.se.axis.com>
	<1161099911.3260.97.camel@sauron>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="218815243-402437620-1161154884=:25906"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-402437620-1161154884=:25906
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Tue, 17 Oct 2006, Artem Bityutskiy wrote:

> the patch looks OK, but it does not apply to the mtd git kernel. Will
> you mind to send a patch against mtd-2.6.git please?

That's what I thought I did ... checked again today, yep it is based=20
against the latest mtdchar.c from mtd-2.6.git tree (dated 2006-09-17).

However, it looks like the patch in the body of the email might have had=20
its whitespace mangled. I did send the patch as an attachement too, did=20
you try that?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-402437620-1161154884=:25906--
