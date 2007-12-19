Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J50BJ-0007j4-Ke
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:46:04 +0000
Date: Wed, 19 Dec 2007 15:45:21 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: JFFS2 on SPI Flash
In-Reply-To: <79ac09b60712190636o88be444ydf873c9ea5f39dca@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0712191543450.21948@lnxricardw.se.axis.com>
References: <79ac09b60712181315y3c913d56o14a8f41efd677fdf@mail.gmail.com>
	<79ac09b60712190636o88be444ydf873c9ea5f39dca@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 19 Dec 2007, Duke wrote:

> Can anyone offer any thoughts?
>
> On 12/18/07, Duke <ezbonites@gmail.com> wrote:
>> Hi, If I choose to have a JFFS2 fs on SPI flash device, what is the=20
>> minimum size required? For example a 16Mbit ST chip has a sector size=20
>> of 512K bit while the Atmel 16Mbit (AT45DB..) has a sector size of=20
>> 128Kbytes.  Is there a rule of tumb to apply for making th choice?

If you have a look in the kernel=20
fs/jffs2/build.c:jffs2_calc_trigger_levels() you can get an idea about how=
=20
much free space you need to do things like delete a file, or write to the=
=20
file system. Basically, two free blocks are needed to delete files, to=20
write, the number of blocks depends on the partition size and the number=20
of blocks in the partition.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
