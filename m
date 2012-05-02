Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPc6c-000737-KD
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 16:08:43 +0000
Received: by lagy4 with SMTP id y4so679112lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 09:08:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
Date: Wed, 2 May 2012 18:08:39 +0200
Message-ID: <CADZ6=av8TJJWRPsT=DrAnthZHO6iBzZ9nJMcHTiEV96TvgWkbA@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Gregory CLEMENT <gclement00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Wagner <deubeuliou@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Gregory,

>> Since I really like the idea of a MTD block device that skips bad
>> blocks when reading I'm currently in the process of re-animating the
>> BBFREE patch <http://lists.infradead.org/pipermail/linux-mtd/2006-Novemb=
er/016835.html>:
>> it compiles for me, but still has some major issues. I'll keep this
>> list up to date on my progress.
>
> a few years ago I also tried to reanimated this patch, it was nearly
> adopted, but there were some argue about bit flipping during read or
> why create a new device driver: see
> http://lists.infradead.org/pipermail/linux-mtd/2007-November/019938.html
> and the dozen of email of this thread.

Ah, I see. Well, as I take it  MTD_BLOCK_RO_BBFREE takes care of
reading back what was actually written instead of "inserting" bad
blocks as the current driver does. Bit rot after many, many reads and
the corresponding flash scrubbing routines are a different kind of
problem. MTD_BLOCK_RO_BBFREE does not solve it, or pretend to solve
it.

> Finally Ricard Wanderlof share his experience about bit flipping
> during reading and concluded that "At least for this chip [ST 256
> Mbit flash], it seemed that if a block has only been written a few
> times, then there seems to be virtually no limit to how many times it
> can be read without bit flips occurring ".

So the bit-rot-after-many-reads-issue is maybe a non-issue?

> About "why create a new device driver" vitally Wool explained it was
> explicitly directed by David because he didn't want to add confusion.

Yepp, I get this, and I think it is a good idea. Still not sure
whether the extra device nodes are a good idea, though. Maybe
MTD_BLOCK_RO_BBFREE (and other flash translation layer code) could
work more like a serial line discipline, so kernel or user space can
attach and detach them to MTDs as required.

> But this patch were never merged in the end, maybe I should have to
> push more.
>
> Since this, at Free Electrons we worked on the same kind of feature
> but based on UBI: ubiblk, see http://lwn.net/Articles/452944/
>
> There were still some minor issue that prevents the patches to be
> included in mtd. I hope David will find time to solve them soon.

This doesn't really help us; we're stuck on kernel 2.6.37 and u-boot
2010-06, both heavily modified by patches from Texas Instruments. To
use the new UBI readonly block device we would need to integrate the
latest linux-mtd into both kernel and u-boot, something which I
consider way more complex (and risky) than trying to go with
MTD_BLOCK_RO_BBFREE for now.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
