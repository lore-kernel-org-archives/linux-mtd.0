Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkPJy-0004Lp-E8
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 11:35:55 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3acy4j6dn.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
	<m3u0wcj899.fsf@maxwell.lnxi.com> <1089729938.8696.115.camel@tubarao>
	<m3acy4j6dn.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Date: Tue, 13 Jul 2004 09:21:48 -0600
Message-Id: <1089732108.8696.127.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-13 at 09:04 -0600, Eric W. Biederman wrote:
> Thayne Harbaugh <tharbaugh@lnxi.com> writes:

> > There's a short list of things that have been removed or changed
> > significantly (although this is from memory and may not match the
> > current code):
> > 
> > * read-back check of written data
> 
> I have a patch  for that already.  Since we are not checking any other
> status bits.  At least verifying the data is correct is useful.  

Wonderful.

> > * retry of failed writes
> 
> This one is more interesting.   I don't know if it should be generic or we should
> just override do_write_one_word...
> 
> One way or another we will get this one back in there.

Good.
 
> > * unlock address for some chips (although this is likely part of the big
> > rewrite)
> > 
> > In the end, it's much appreciated that everything was cleaned up - there
> > were some major things done that I wanted to do but was too timid to do
> > major overhauling of the code.  Unfortunately it was just continuing to
> > grow harrier and uglier.
> 
> Thayne this problem I am not familiar with.  Could I have some details?

Errrr . . . the problem of the unlock address or of the harry, ugly
code?

The unlock story is that there was *no* unlock code in cfi_cmdset_0002.
One of the newer SST chips requires unlocking of the blocks.  Unlike
other chips that need unlocking, the addresses for unlocking this
particular chip is not at the block address but below the address of the
entire chip.

It was strange, but I figured that since there wasn't already an unlock
function it wouldn't matter that the new one was chip specific and less
than ideal.  Of course no more than a few weeks after I put it in the
unlock function was needed for *sane* flash chips and so the unlock code
was *corrected*.

The problem with the harry and ugly code was that the status checking
code was reproduced in multiple spots (at least three).  It was bulky
and very sensitive.  All of it needed to be consolidated into a single
location.  That was part of the last, major rewrite that *fixed* some of
the things that should have been left in.
