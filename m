From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20040413093133.GA29499@wohnheim.fh-wedel.de>
References: <40742192.5030901@imc-berlin.de>
	 <1081354787.4799.191.camel@tubarao> <407553A5.5010702@imc-berlin.de>
	 <20040408143717.GA1921@wohnheim.fh-wedel.de>
	 <1081514570.20197.182.camel@imladris.demon.co.uk>
	 <20040413093133.GA29499@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1081853998.8080.19.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Tue, 13 Apr 2004 10:28:06 -0400
Content-Transfer-Encoding: 8bit
cc: Steven Scholz <steven.scholz@imc-berlin.de>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-04-13 at 11:31 +0200, Jörn Engel wrote:
> > Well, switching from CVS wouldn't necessarily make any difference. If I
> > were using something like BitKeeper then there'd still only be one
> > repository which I actually _care_ about, and the effect would be much
> > the same. 
> 
> Right.  That I see the problem doesn't mean that I also see a
> solution. :(

The point is that there isn't a 'solution', and that the problem isn't
CVS.

The 'problem' is the task at hand -- maintaining a kernel subsystem that
only a few people care deeply about.

I think it needs to be done outside Linus' tree, for the following
reasons:
 - Patches are of varying quality and I don't have time to vet or 
   rewrite them all before timely inclusion. 
 - People don't use the current kernels, even though they should.
 - Having a development branch which gets fairly widespead testing
   is useful.

Letting people commit directly to CVS seems to work fairly well. It gets
stuff tested without me having to do everything myself, and makes it
nice and easy for people to take over 'maintenance' of individual
drivers. I think we manage to keep a fairly reasonable balance of
stability in CVS too -- it's not often broken.

The downside is that it does take a while for Linus' tree to get
updated, and that's partly because the procedure involves real human
intervention to vet all the changes that have gone in.

But that vetting has to be done _whatever_ happens. The question is do
we restrict the number of people who can commit to CVS, and make people
submit patches for vetting before they're committed, or do we let them
commit first and then improve it over time if such is necessary?

Again, I think we have the balance right. People commit reasonable
patches to CVS, and occasionally I may revert them if I _really_ object.
But they don't have to go through me or other people first, and there's
not a bottleneck during _submission_.

I'm always open to suggestions for how to improve the process -- but I
don't have any ideas. If someone's offended that a particular feature
hasn't made it into Linus' tree, the best course of action I can
recommend is to go through my update procedure themselves, merging
changes from Linus' tree into CVS in a way which works in both 2.4 and
2.6, and then producing a _clean_ patch which Linus will accept, and
which updates his tree to match what's now in CVS. Then mail it to me
and I'll look at it. If it's all fine, all I need to do is look, and I
can say "OK, Linus please apply this patch". 
> 2, 3 and 4 involve some manual work that could be automated, not sure
> if you've already done that.  If you don't a human "patch assistant"
> could help you, although I don't suspect many volunteers. ;)

It's not a lot of manual work. Lots of 'grep $Id: | cut ... xargs cvs'
but that's not really 'manual'.

> 7 is a bit philosophical.  It would be easier if patches were kept
> seperate from the beginning, something CVS doesn't allow to do.  But
> then you need to deal with dependences between them, and - worse -
> make sure that seperate patches remain seperate.  It would make
> merging easier, but the time before merging will be different, much
> harder unless everyone has the discipline for it.

It's not so hard. I rarely want to make changes to any given file in
more than one changeset. Before BK I could just make a single big
'update' patch then open it in emacs and cut'n'paste into separate
files. With BK I use citool to commit selected files in different csets.

> Propably this wouldn't work in your current mode of "everyone dump
> into CVS", you'd have more work reading and refusing patches.  That
> work is currently distributed, which makes your life easier somewhere
> else.

Indeed -- and it makes other peoples lives easier too because they can
actually move on without waiting for me (or other trustworthy people to
whom I could delegate the task -- they exist, but they're probably not
blessed with any more copious quantities of free time than I am).

-- 
dwmw2
