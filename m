Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ja4XU-0005V1-OM
	for linux-mtd@lists.infradead.org; Fri, 14 Mar 2008 07:41:17 +0000
Date: Fri, 14 Mar 2008 08:41:00 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Manuel Sahm <Manuel.Sahm@feig.de>
Subject: Re: Binary Nandwrite/read to Flash
In-Reply-To: <47D94451.7080108@feig.de>
Message-ID: <Pine.LNX.4.64.0803140839390.6032@lnxricardw.se.axis.com>
References: <47D91B98.20001@feig.de>
	<Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
	<47D92581.1030007@feig.de>
	<Pine.LNX.4.64.0803131448330.6032@lnxricardw.se.axis.com>
	<47D938C1.6040804@feig.de>
	<Pine.LNX.4.64.0803131525230.6032@lnxricardw.se.axis.com>
	<47D94451.7080108@feig.de>
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


On Thu, 13 Mar 2008, Manuel Sahm wrote:

>>> Is it possible to write/read to the NAND flash "directly" without an=20
>>> partition ?(/dev/mtdX) ?
>>=20
>> No, but you can set up a /dev/mtdX device to span the whole device, even=
 if=20
>> you then have additional /dev/mtdX devices which refer to partitions.
>>=20
> it=B4s very dangerous, because if I use the wrong address I=B4ll kill my =
system=20
> :-)
>
> Is ther a possibility to make the /dev/mtdX read only (write protected) ?

Yes, in the driver that registers the flash with mtd you can specify that=
=20
the partition should be read only. However, as far as I know [someone=20
please correct me if I'm wrong] this can then not be changed while the=20
system is running, so it's not possible to write or erase the partition=20
without rebooting.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
