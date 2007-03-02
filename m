Received: from resonance.org ([12.165.58.239] helo=earth.resonance.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HNBFe-0008Uz-2d
	for linux-mtd@lists.infradead.org; Fri, 02 Mar 2007 12:09:04 -0500
Subject: Re: JFFS2 file system slowly filling up for unknown reason ~20
	seconds after mount
From: Josh Green <josh@resonance.org>
To: Pete MacKay <linux@architechnical.net>
In-Reply-To: <48818.69.30.123.186.1172794036.squirrel@www.architechnical.net>
References: <48818.69.30.123.186.1172794036.squirrel@www.architechnical.net>
Content-Type: text/plain
Date: Fri, 02 Mar 2007 18:07:47 +0000
Message-Id: <1172858867.12314.9.camel@localhost>
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

On Thu, 2007-03-01 at 19:07 -0500, Pete MacKay wrote:
> I tried getting this part to work with 2.6.18 and saw similar behavior
> at one point, but we've since changed hardware to use OneNAND.  One
> thought I have is to try padding the file system to use the full
> partition, so you'd add "--pad=0xa40000" to the mkfs.jffs2 command line,
> and make sure you're using a version of mtd-utils that correctly writes
> the OOB on that device (another problem we had).  BTW, the mkfs.jffs2 we
> use has a bug where it doesn't parse the '-p' option properly but does
> with '--pad='.  Good luck!
> 

I tried the pad option before with stranger results (lots of error
output during mount).  Thanks for the tips on the mtd-utils and the OOB
stuff, in fact I suspect that could very well be what I'm experiencing.
Something wrong with the way the OOB stuff is being written.  I turned
on verbose errors for the MTD sub system and I get a load of these
messages after mounting, which continue until the partition indicates
that it is full (gee if that isn't suspicious I don't know what is).
There were also messages related to the garbage collector interspersed
with these when I turned up the verbosity of error reporting.

nand_write_oob: Attempt to write past end of page
nand_write_oob: Attempt to write past end of page
...

> P.S. If I had it to do all over again I'd have made maps of the factory
> marked bad blocks, as I had to 'nuke' the chip by marking them all good
> again (U-boot lets you do this with a conditional, but created the need
> for it in the first place by writing the cleanmarker in the wrong place
> in the OOB - namely the bad block marker!).
> 

Fortunately with the device I have I don't believe there are any bad
blocks (at least there were none reported when I got it, although that
could also be a bad thing).

Thanks go as well to the others who responded.  I'm well aware that this
kernel is outdated.  Unfortunately its what we have to work with for
now.  I'll be quite happy when this platform is supported in the main
kernel tree.

Best regards,
	Josh Green
