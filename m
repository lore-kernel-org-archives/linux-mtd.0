Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBvLV-0007c2-Ue
	for linux-mtd@lists.infradead.org; Fri, 09 Apr 2004 13:42:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20040408143717.GA1921@wohnheim.fh-wedel.de>
References: <40742192.5030901@imc-berlin.de>
	 <1081354787.4799.191.camel@tubarao> <407553A5.5010702@imc-berlin.de>
	 <20040408143717.GA1921@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1081514570.20197.182.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 09 Apr 2004 13:42:50 +0100
Content-Transfer-Encoding: 8bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-04-08 at 16:37 +0200, Jörn Engel wrote:
> Don't blame him, this is the result of using CVS, which is designed
> around the assumption of a single central repository.

Well, switching from CVS wouldn't necessarily make any difference. If I
were using something like BitKeeper then there'd still only be one
repository which I actually _care_ about, and the effect would be much
the same. 

I'd be quite interested in setting up a CVS->BK gateway like the ALSA
one though. That might make my life easier.

>   If current sync speed is to slow for you, try to make it easier for
> him to send patches forward.

I've been fairly busy recently; I've updated the code in Linus' tree a
little while ago but it could do with another update. I'm very much
slower to update 2.4 unless it's actually broken. The 2.4 branch is old
and dead now; all development should be on 2.6

The way the update goes is something like this...

1. Wait till the MTD CVS code is actually stable. It's not at the
   moment; cfi_cmdset_0002.c is known to be broken and I can't send it
   off while it's like that.

2. Look at the current version of the kernel I'm updating. For each file
   in drivers/mtd and include/linux/mtd, take the version from CVS with
   matching $Id$ tag -- the version from CVS which was last sent to
   Linus or Marcelo for inclusion.

3. Generate a patch between those versions in my CVS, and the version
   currently in the mainstream kernel -- those are the patches which
   were included in an upstream kernel but didn't go through me. Read
   each change carefully, and see if it's applicable to _current_ CVS
   code. If so, apply it. If not, discard it. If it's discarded because
   the problem was already fixed, that's fine. If it's discarded because
   it's just a bogus change, make a mental note of it; reversion of
   upstream patches needs to be justified (or at least noted) in your
   covering email because it's often done by accident when updating 
   Linus' tree from an external CVS, and it's _very_ much frowned upon.

4. Now you have all the upstream changes merged into current CVS. Drop
   current CVS into a current Linux tree, take a diff between the two. 
   Read it. All of it. Make cosmetic changes in CVS to reduce noise in
   the patch you're planning to send.

5. Read it again. 

6. Build it. Test it if you're feeling conscientious.

7. Read it again. Identify separate change sets from the whole thing;
   'bk citool' is useful for this. Commit each set of changes separately
   with an appropriate changelog. 

8. Stick it in a BK tree somewhere for Linus or Marcelo to pull from.

You can, of course, replace #7 and #8 with splitting it up into separate
patches and mailbombing if you have religious objections to BK.


But generally, we try to keep CVS working and stable. It's rare that it
is non-working for a prolonged period of time. You _should_ be able to
just drop it in to a recent 2.4 or 2.6 kernel and expect it to 'just
work'.

If I had hardware with interleaved AMD chips to hand, I'd have a look at
it (or at least wander round the corner to Arcom and take away David's
excuse :)

-- 
dwmw2
