Received: from [203.96.16.160] (helo=blood.actrix.co.nz)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZZiv-0001TG-HB
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 15:05:46 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Date: Wed, 9 Nov 2005 09:03:49 +1300
References: <200511071915.03263.tglx@linutronix.de>
	<4370B1EC.8000504@yandex.ru>
In-Reply-To: <4370B1EC.8000504@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511090903.49561.manningc2@actrix.gen.nz>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 09 November 2005 03:10, Artem B. Bityutskiy wrote:
> Thomas Gleixner wrote:
> > - [MTD] NAND: OOB changes
> > 	Needs more thoughts. I'm particularly unhappy with the introduction of
> > new functions and the still pending problem of the automatic
> > placement/retrieval of oob data. The change should subsume and/or extend
> > the oob_info functionality rather than introducing a parallel solution.
>
> As for me, the ideal would be to have:
> 1. a method to fetch the number of OOB bytes available for user;

Agree. At present YAFFS2 using oob_size to allocate local oob buffers etc, but 
that is not really the right thing to be doing, AFAIK.

> 2. a method of read/write a buffer of that length to/from OOB; that
> space may be non-contiguous, but this should be hidden from the user.

I think what is missing most is a definitive specification. read_oob is 
ambiguous since there is no specification of what it provides (AUTOPLACEd or 
raw or something else).

Personally, I think we can do without read_oob() and instead just use 
read/write_ecc() with dataptr == NULL.

>
> Complications like the need to supply oob_info look unreasonable to me.
> Most (may be all?) people don't care about the OOB layout and just want
> to read/write data from/to it. So, I agree with Charles.
>
> Any example of when users want to know the oob layout? May be nanddump
> utilities? Not sure.

Probably more important is just being able to get a raw nanddump so that an 
image can be taken for manufacturing purposes or debug dumping etc.

YAFFS1 (or YAFFS2 running YAFFS1 backwad compatability) still uses an oobinfo 
to pass SmartMedia style ECC placement. It does this to be able to do bad 
block marking itself rather than use the more recent mtd bad block marking 
stuff. If this has to change to make things better I won't cry.

-- Charles
