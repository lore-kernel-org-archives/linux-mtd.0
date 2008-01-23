Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHbu4-0005Wd-03
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 09:28:22 +0000
Date: Wed, 23 Jan 2008 10:27:23 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Adams Richard-W36112 <rgadams@motorola.com>
Subject: RE: problem with 2k page NAND with squashfs
In-Reply-To: <A2EC06CB0E393B4C8EB220B286B7083E05897220@ct11exm60.ds.mot.com>
Message-ID: <Pine.LNX.4.64.0801231024270.25733@lnxricardw.se.axis.com>
References: <A2EC06CB0E393B4C8EB220B286B7083E05897213@ct11exm60.ds.mot.com>
	<20080122084910.2939d94a@weaponx>
	<A2EC06CB0E393B4C8EB220B286B7083E05897220@ct11exm60.ds.mot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 22 Jan 2008, Adams Richard-W36112 wrote:

>> On Tue, 22 Jan 2008 09:15:29 -0500
>> "Adams Richard-W36112" <rgadams@motorola.com> wrote:
>>
>>>  I have an arm-based embedded system running a 2.6.10 kernel. I'm
> ...
> Before I went through the effort I wanted to check with the list to see
> if anyone knows that there is or isn't an issue with the 2k NAND page
> size on this vintage kernel.

You could check in drivers/mtd/nand/nand_ids.c and see if your flash chip,=
=20
or indeed any chip with that page size is listed there. Even if it is,=20
there could still be a bug of course.

I seem to remember some kernel of similar vintage failing with large-page=
=20
flash chips because the driver tried to kmalloc a buffer the size of a=20
block, which failed for chips with 128 KiB blocks, because of limitations=
=20
of the amount of memory that could allocated in one go with kmalloc.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
