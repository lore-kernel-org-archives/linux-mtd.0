Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPewt-0005RF-O9
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 08:15:58 -0500
Date: Fri, 9 Mar 2007 14:11:45 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: JFFS2 OOPS in 2.6.20
Message-ID: <20070309131144.GC4897@lazybastard.org>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432976.26465.31.camel@gentoo-jocke.transmode.se>
	<1173433611.3461.566.camel@pmac.infradead.org>
	<1173437780.26465.47.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1173437780.26465.47.camel@gentoo-jocke.transmode.se>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 March 2007 11:56:20 +0100, Joakim Tjernlund wrote:
> 
> Yeah, but I figured that changing seed was less intrusive. Not 
> sure how good Alder32 is but if we make an incompatible change we
> could change it to something else than crc32. We should measure if 
> how much faster Adler32 is first though.
> 
> You think such a change is worthwhile?

Last time we discussed this, crc32 looked better.  It may be a bit
slower (not much, iirc), but it will catch _all_ 1-bit, 2-bit and 3-bit
errors and has a 1:2^32 change of missing n-bit errors with n>3.

Adler, if memory serves, can only guarantee all 1-bit errors and a
1:2^30 or so chance for n-bit errors, if the buffer is long enough.
"Long enough" is ~1000 bytes.  Below that, chances of getting false
positives are getting higher.

You can check the archives for this.  It might have been 2004 as well.

Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
