Subject: Re: JFFS2 OOPS in 2.6.20
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1173432976.26465.31.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432976.26465.31.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Fri, 09 Mar 2007 09:46:51 +0000
Message-Id: <1173433611.3461.566.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-09 at 10:36 +0100, Joakim Tjernlund wrote:
> I am starting to think that this error is due to an old design mistake
> in JFFS2 I pointed out years ago: crc32 sums are seeded with zero instead of -1

Indeed. But you only pointed it out in 2004, which was 3 years too
late :)
 
> Zero seed makes an zeroed JFFS2 header match its crc32 and that is what I think
> is happening here, readinode.c:576 should reject this node but doesn't due to this flaw)
> 
> What to do:
> 1) Add extra checks for zeroed headers?

That's the approach in the patch I just sent you.

> 2) Add an config option where one can change the crc32 seed to -1? 

If we're going to change it, why not change to something cheaper, like
Adler32? As you also pointed out. I suspect we should just leave it as
it is with the extra checks though.

-- 
dwmw2
