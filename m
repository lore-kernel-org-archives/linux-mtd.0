Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrsC9-00007K-MQ
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 03:32:02 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	kB68Vmd3007676
	for <linux-mtd@lists.infradead.org>; Wed, 6 Dec 2006 09:31:48 +0100
Date: Wed, 6 Dec 2006 09:31:14 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Finding flash type...
In-Reply-To: <1165370753.2679.5.camel@crusty.rchland.ibm.com>
Message-ID: <Pine.LNX.4.64.0612060929280.29536@lnxricardw.se.axis.com>
References: <20061206014432.56808.qmail@web30201.mail.mud.yahoo.com>
	<1165370753.2679.5.camel@crusty.rchland.ibm.com>
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


On Tue, 5 Dec 2006, Josh Boyer wrote:

>> 2. Should any other information be also exported ? The
>> mtd_info_user structure [include/mtd-abi.h] has
>> additional fields that might be useful - size,
>> erasesize, oobblock(if present) ?
>
> Yes, most of mtd_info_user would be good to export.

For NAND flash chips I think it would also be nice to get a list of bad=20
blocks. This can be most useful when debugging.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
