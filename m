Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdsMu-0003wY-0U
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 13:21:02 -0400
Received: by ug-out-1314.google.com with SMTP id m2so1031392ugc
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 May 2006 10:20:58 -0700 (PDT)
Message-ID: <625fc13d0605101020i5a21bcf5t1eea0401c350a5f3@mail.gmail.com>
Date: Wed, 10 May 2006 12:20:58 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
In-Reply-To: <20060511.020420.12190675.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<20060511.020420.12190675.anemo@mba.ocn.ne.jp>
Cc: linux-mtd@lists.infradead.org, vwool@ru.mvista.com
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/10/06, Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> On Wed, 10 May 2006 06:00:57 -0500, "Josh Boyer" <jwboyer@gmail.com> wrot=
e:
> > Not quite the case.  You need bad block skipping, yes.  But NAND can
> > get bit flips in good blocks still.  How do you deal with that?  You
> > can't leave the block in that state forever because it will continue
> > to get bit flips and then your data will be unusable.
>
> If I mounted a JFFS2 filesystem on NAND and _never_ write anything (or
> mounted read-only), does current MTD/NAND/JFFS2 layer handle those bit
> flips?  I've thought JFFS2 only reassign blocks on writing, so JFFS2
> also suffer those "bit flips on read" problem, is it right?

If you truly never write anything, then yes it probably suffers from
the same problem.  In a typical JFFS2 setup where writes do occur, the
theory is that garbage collection will eventually reclaim that block.=20
Whether that actually happens or not is largely determined on a per
use case basis.

josh
