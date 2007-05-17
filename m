Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HonA7-0000PM-6n
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 17:05:30 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l4HL5JHu018702
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 23:05:19 +0200
Date: Thu, 17 May 2007 23:06:40 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: choice of flash file system for large read-only volume
In-Reply-To: <20070516142238.GA5725@cloud.net.au>
Message-ID: <Pine.LNX.4.64.0705172303500.1882@lnxricardw.se.axis.com>
References: <20070516142238.GA5725@cloud.net.au>
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


On Thu, 17 May 2007, Hamish Moffatt wrote:

> What would be a good choice of file system for this application? Does it
> come down to JFFS2 versus YAFFS, or are there other alternatives?
>
> I understand that JFFS2 mount times are proportional to the size; mount
> time isn't critical to me but I would like the system to boot as quickly
> as possible. Is YAFFS better in this regard?

One option you might consider if you have enough ram, is simply to make a=
=20
copy of a read-only file system such as cramfs in the flash, and upon=20
boot, copy it from flash to ram (skipping bad blocks of course), and=20
running it from there. Of course, you cannot write to cramfs, so that=20
would not be a good idea during development.

Since a straight copy from flash to ram can be reasonably fast, and=20
accessing cramfs in ram is quite fast, boot time is shorter to or=20
comparable to having the root partition directly in the flash as a jffs2=20
partition, in my experience.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
