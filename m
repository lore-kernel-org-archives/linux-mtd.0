Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTvKw-0006GO-26
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 15:06:08 +0000
To: "Gupta, Pekon" <pekon@ti.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Grow UBI device?
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
In-reply-to: <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
Date: Wed, 09 Oct 2013 17:05:38 +0200
Message-Id: <20131009150538.BAD57380432@gemini.denx.de>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear "Gupta, Pekon",

In message <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com> you wrote:
>
> > > It would be nice if I could start with a UBI device that is smaller
> > > than the NAND, so I can keep an existing MTD partition with a JFFS2
> > > file system. After copying the data from JFFS2 to a UBIFS volume, I
> > > would like to free and reuse the space of this JFFS2 partition.
> > >
> That seems to be a nice move, but where would you copy the existing
> JFFS2 data ?

Well, I wrote: "copy[...] the data from JFFS2 to a UBIFS volume".

> (a) In memory, then there is threat of losing the data due to
>   power-failure, and you should have enough RAM.
> (b) copy to target UBIFS volume/partition. So assumption is that target
>   UBI volume has enough space and is writable.
> I'm assuming (b) is more workable .. 

...which is what I'm after.

> > Come to think of it, I'm not sure that would work anyway, as the
> > resulting, new, enlarged partition would partly contain UBI data and
> > partly old jffs2 data. I'm not sure what UBI does when it encounters
> > incorrect data, if it just erases the relevant blocks and formats them for
> > its own use, or if it barfs completely and just bails out complaining that
> > the partition does not contain UBI data. If the relevant blocks were
> > erased, then I think UBI would simply concede that the a previous erase
> > attempt had been prematurely aborted, and re-erase the blocks and write
> > its headers, so perhaps that is something to try. At any rate it involves
> > at least some mild trickery (erase the blocks that previously contained
> > jffs2 data).
> > 
> Yes, during mounting of UBIFS volumes, UBI checks for erase-header
> on first-page of every block. 

Mounting UBIFS volumes should not be a problem - the existing ones are
not located in the newly added area of the NAND.  The question however
is what the UBI layer itself does, if I for example try to create a
new volume which then would allocate blocks from the newly added
space.

> So, effectively you don't even need to erase the partition to convert
> it into UBI volume, you just try attaching it as UBI volume and UBI
> should erase it for you. (though flagging some warnings on the way).

Are you sure about that?

Well, I guess I'll have to try it out in the end...


Thanks!

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Deliver yesterday, code today, think tomorrow."
