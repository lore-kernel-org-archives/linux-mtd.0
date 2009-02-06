Received: from miranda.se.axis.com ([193.13.178.8])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVNZc-0001pp-60
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 10:04:38 +0000
Date: Fri, 6 Feb 2009 10:58:15 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Subject: Re: cannot access NAND STL partition
In-Reply-To: <4C336FC8FE0F441DA6FAB8337E58BB54@sky>
Message-ID: <Pine.LNX.4.64.0902061056160.19761@lnxricardw.se.axis.com>
References: <4C336FC8FE0F441DA6FAB8337E58BB54@sky>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 6 Feb 2009, Iram Shahzad wrote:

> But the flash has to be programmed using a special flash
> writer. While doing this the flash is divided into several
> partitions, some partitions are STL and the others are BML.
> Now I find that u-boot/Linux can read BML partitions correctly
> but cannot read STL partitions. Reading STL partition gives
> unexpected data.

I assume BML =3D Block Management Layer and STL =3D Sector Transition Layer=
?
From=20an MTD and JFFS2 point of view the terminology sounds slightly odd,=
=20
exactly what type of file system are you using and exactly what type of=20
BML and STL are you referring to?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
