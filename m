Received: from miranda.se.axis.com ([193.13.178.8])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iazde-0000yl-0b
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 21:07:12 +0100
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l8RK6ri2032713
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 22:06:53 +0200
Date: Thu, 27 Sep 2007 22:06:46 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: your mail
In-Reply-To: <VSNLCHNFE002syCCr8H0000c0ce@VSNLCHNFE002.VSNLXCHANGE.COM>
Message-ID: <Pine.LNX.4.64.0709272205450.28670@lnxricardw.se.axis.com>
References: <VSNLCHNFE002syCCr8H0000c0ce@VSNLCHNFE002.VSNLXCHANGE.COM>
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


On Thu, 27 Sep 2007, Gangadhar Kodishala wrote:

> I created another partition on NAND to use specifically for the data. I
> would like to create a JFFS2 file system on this data partition, mount it
> and use it to store my application code and data files,

If you just want to create an empty JFFS2 file system, then just erase the=
=20
partition, and mount it.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
