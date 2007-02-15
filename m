Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHnwD-0005pG-OS
	for linux-mtd@lists.infradead.org; Thu, 15 Feb 2007 16:14:47 -0500
Date: Thu, 15 Feb 2007 22:16:32 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Jitendra Jain <jitendra.jain@einfochips.com>
Subject: Re: Compare 'cp' and 'nandwrite'
In-Reply-To: <00cc01c750e3$9378bc30$fd09a8c0@jitendrajain>
Message-ID: <Pine.LNX.4.64.0702152215240.29846@lnxricardw.se.axis.com>
References: <00cc01c750e3$9378bc30$fd09a8c0@jitendrajain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 15 Feb 2007, Jitendra Jain wrote:

> Hi all,
>
> Can anyone explains me the difference between using nandwrite and cp
> command for flashing JFFS2 filesystem?

Nandwrite skips bad blocks in a nand flash when writing, whereas cp will=20
stop with a write error as soon as it encounters one. If you don't have=20
any bad blocks in the flash (or at least not where you want to write your=
=20
image), there should be no practical difference.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
