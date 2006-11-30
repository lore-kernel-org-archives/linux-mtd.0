Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GpicC-00080H-R9
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 04:54:04 -0500
Date: Thu, 30 Nov 2006 10:53:04 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Siddharth Choudhuri <siddh_c@yahoo.com>
Subject: Re: Finding flash type...
In-Reply-To: <20061129185335.89361.qmail@web30205.mail.mud.yahoo.com>
Message-ID: <Pine.LNX.4.64.0611301044390.5328@lnxricardw.se.axis.com>
References: <20061129185335.89361.qmail@web30205.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 29 Nov 2006, Siddharth Choudhuri wrote:

> Is it possible to know what kind of flash (NOR type or
> NAND type) is installed on a system ? (may be using
> lsmod -or- cat /proc/ksyms | grep ? )

There is an ioctl (MEMGETINFO) that provides information on the type of=20
flash memory among other info about the device. It is used by the=20
mtd_debug utility which is part of the mtd-utils package, which dumps the=
=20
information in human-readable form.

You can otherwise guess by checking the erasesize provided by
cat /proc/mtd, comparing the erasesize against expected erase sizes for=20
the devices you expect to find. As a general solution this doesn't work=20
well though.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
