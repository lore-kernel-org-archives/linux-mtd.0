Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lqjty-0001K3-TD
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 08:10:01 +0000
Date: Mon, 6 Apr 2009 10:09:37 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
In-Reply-To: <20090405194335.GA10484@Chamillionaire.breakpoint.cc>
Message-ID: <Pine.LNX.4.64.0904061001520.9213@lnxricardw.se.axis.com>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
	<Pine.LNX.4.64.0903261650100.9213@lnxricardw.se.axis.com>
	<20090405194335.GA10484@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Jamie Lokier <jamie@shareable.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 5 Apr 2009, Sebastian Andrzej Siewior wrote:

>> erase). In the case of a failed erase, the sector might not be properly
>> erased (i.e. even though the bytes might read 0xFF they might not be
>> properly erase, resulting in spurious bitflips later). So, the kernel mu=
st
>> erase the sector (which for a NOR flash is a slow operation) before writ=
ing
>> the cleanmarker.
>
> and this can happen anyway so your clean-marker support in
> flash_eraseall does not help here.

Yes, it can happen anyway, but if there are no cleanmarkers in the image,=
=20
you get a performance penalty on every boot from a virgin image. While=20
not often in the course of a product's lifetime, imagine someone=20
upgrading a bunch of identical products, the rewriting of cleanmarkers can=
=20
make the boot after each upgrade much slower, thus significantly=20
increasing the upgrade time. Similarly in production, where time is a=20
premium, any lengthening of the product boot time (e.g. before final=20
testing) is bad.

Of course, it must still be present in the kernel to handle the case of=20
failed erase, but that doesn't it stop it from being very handy in=20
flash_eraseall as well.

One thing that would be handy would be if one could give a=20
"jffs2-cleanmarker" flag to the erase ioctl which would automatically=20
write a cleanmarker after erasing the block, in accordance with the custom=
=20
of the day for the particular kernel version in question. However, apart=20
from the fact that it may be difficult to extend the ioctl functionality,=
=20
mixing driver levels (i.e. mtd and jffs2) in this way is probably not=20
considered too clean.

> Please don't get me wrong. I don't want to rip clean-markers out from
> jffs2. I just thought, that it is enough to have it in kernel since it is
> the only place where the final layout is known.

I didn't misunderstand you. I just want to argue that putting down=20
cleanmarkers when the flash is erased rather than later is an optimization=
=20
that can be useful in practice.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
