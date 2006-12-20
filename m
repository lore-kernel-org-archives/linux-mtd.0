Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gwy1p-0007hu-4a
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 04:46:27 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	kBK9kHnP005010
	for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2006 10:46:17 +0100
Date: Wed, 20 Dec 2006 10:46:14 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Reduce boot time with jffs2 and CM-X255
In-Reply-To: <1166607669.3939.18.camel@sauron>
Message-ID: <Pine.LNX.4.64.0612201043390.11369@lnxricardw.se.axis.com>
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
	<4588F67A.6080602@sacet.com>
	<Pine.LNX.4.64.0612201007240.11369@lnxricardw.se.axis.com>
	<1166607669.3939.18.camel@sauron>
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


On Wed, 20 Dec 2006, Artem Bityutskiy wrote:

>> I don't know what the solution is - one idea is that a program like
>> nandwrite could be instructed to write cleanmarkers to the OOB of unused
>> parts of a partition. Currently there is no support for this but it coul=
d
>> be added.
>
> nandwrite -o ?

Yes, but that assumes the image contains the cleanmarkers. Can mkfs.jffs2=
=20
create images with cleanmarkers in the oob? And wouldn't that conflict=20
with mtd ecc usage, i.e. doesn't ecc information then also have to be in=20
the image?

>>
>> Hm, sidetracking here a bit, I'm thinking a general erase + write image
>> utility for NAND flash would be useful, given that bad block management
>> ...
> I would recommend to improve/re-work/upgrade nandwrite instead of a new
> tool.

Yes I think that's probably the best route. I've been thinking about this=
=20
for some time, but haven't really come to a conclusion about exactly what=
=20
to include in such an upgrade. (I know I've posted some ideas earlier on=20
the list; thanks for the responses btw).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
