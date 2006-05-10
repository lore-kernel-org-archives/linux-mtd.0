Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdusm-00068q-16
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 16:02:13 -0400
Date: Wed, 10 May 2006 22:01:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060510200138.GA31385@wohnheim.fh-wedel.de>
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<20060511.020420.12190675.anemo@mba.ocn.ne.jp>
	<625fc13d0605101020i5a21bcf5t1eea0401c350a5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0605101020i5a21bcf5t1eea0401c350a5f3@mail.gmail.com>
Cc: vwool@ru.mvista.com, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	linux-mtd@lists.infradead.org
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 May 2006 12:20:58 -0500, Josh Boyer wrote:
> On 5/10/06, Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> >
> >If I mounted a JFFS2 filesystem on NAND and _never_ write anything (or
> >mounted read-only), does current MTD/NAND/JFFS2 layer handle those bit
> >flips?  I've thought JFFS2 only reassign blocks on writing, so JFFS2
> >also suffer those "bit flips on read" problem, is it right?
> 
> If you truly never write anything, then yes it probably suffers from
> the same problem.  In a typical JFFS2 setup where writes do occur, the
> theory is that garbage collection will eventually reclaim that block. 
> Whether that actually happens or not is largely determined on a per
> use case basis.

The fact remains that jffs2 only scrubs bad blocks by accident on a
random basis.  And it couldn't do more anyway.  Nothing in mtd
indicates a correctable error that would require scrubbing.

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
