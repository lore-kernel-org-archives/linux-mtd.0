Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFTXR-000267-Pz
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 05:26:57 -0400
Date: Wed, 14 Sep 2005 11:26:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Marius Groeger <mgroeger@sysgo.com>
Message-ID: <20050914092634.GB22847@wohnheim.fh-wedel.de>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
	<20050913230631.GB29579@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
Cc: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 September 2005 09:05:31 +0200, Marius Groeger wrote:
> On Wed, 14 Sep 2005, Jörn Engel wrote:
> 
> >Rejected.  Examplary reasons below...
> 
> Unless you feel your comments are insignificant, please don't put them 
> below the sigdashes "-- <NL>". Otherwise good Mailers will strip them 
> in the reply.

Good point.  Sorry about that.

> >In principle, I'd like a patch to silence gcc warnings.  But only when
> >the patch actually improves code quality.  If I get to choose between
> >bad code and compiler warnings, I'll pick the warning.
> [...]
> >> -                     unsigned long *datum = ebuf + i;
> >> +                     unsigned long *datum = (unsigned long *)((char*)
> >ebuf + i);
> >
> >Arithmetic with void* pointers is one of the best gcc extensions.  Use
> >it!  The above is obviously correct, while below makes my brain rotate
> >around itself at dangerous speed.
> 
> If I get to choose between portable code and some remote developers 
> brain rotation, I'll pick the portable code. :-)

It's a good thing that we both agree on this.  :)

Is anyone actually using JFFS2 with a non-gcc compiler?  Intel's
compiler counts as gcc-compatible here, they included all gcc
extensions used in the kernel, for obvious reasons.

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
