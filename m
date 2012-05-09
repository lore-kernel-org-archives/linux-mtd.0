Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SS9PM-000876-2s
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 16:06:37 +0000
Date: Wed, 9 May 2012 18:05:48 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: Re: mtd oob test is failing consistently at same places in NAND flash
Message-ID: <20120509160548.GB12280@parrot.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
 <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
 <20120508184516.GA16380@parrot.com>
 <518397C60809E147AF5323E0420B992E3E9366EF@DBDE01.ent.ti.com>
 <20120509152437.GA12280@parrot.com>
 <518397C60809E147AF5323E0420B992E3E936732@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <518397C60809E147AF5323E0420B992E3E936732@DBDE01.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 09, 2012 at 04:46:17PM +0100, Philip, Avinash wrote:
> > > 
> > > Yes, we had using patched kernel. OOB free region is exposed.
> > > 
> > > ECC layout will be as follows.
> > > 
> > > 0-1	-> BAD block marking
> > > 2-57  -> ECC byte position, ( 14 bytes for 512 byte)
> > > 58-63 -> oob free bytes
> > > 
> > > mtd->ecclayout->eccbytes		= 56
> > > mtd->ecclayout->eccpos[0]	= 2
> > > mtd->ecclayout->oobavail		= 6
> > > mtd->ecclayout->oobfree[0].offset	= 58
> > > mtd->ecclayout->oobfree[0].length	= 6
> > > 
> > 
> > OK, then it is quite normal that mtd_oobtest should fail when it encounters a bitflip (one that does not match the programmed data) in those unprotected 6 bytes (58-63). What do you think ?
> 
> 
> Is this behavior is expected for which OOB area left unprotected?
> (I am not sure, What I understood is with failure in OOB area, ECC won't be useful.

Yes.

> Is it ideally we should have ECC protection for OOB area also required?)

There is no need for ECC protection on free oob bytes if you do not use them.

> Basically I am testing why bit flips is happening in OOB area. Some observation related
> to mtd_oob test in the setup we are having is
> 1. Modify mtd_oob test to write patterns (0x0, 0x55, 0xAA, 0xff), then test is getting passed
> for all patterns.

OK, strange.

> 2. On inserting a delay of 10 ms after erase_whole_device() in mtd oob test, test is getting passed.
> I can't correlate how test is getting passed on modifying pattern as we are covering all bits in
> either of the patterns.
> 
> On inserting delay test is getting passed, will point to me some problems in command issue. I am
> debugging on this.
> 

OK. If you are relying on a R/nB pin to wait for operation completion, you
might want to check that is works properly.

BR,
-- 
Ivan
