Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkcZE-0007tS-Ah
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 01:44:33 -0400
To: linux-mtd@lists.infradead.org
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
	<m3u0wcj899.fsf@maxwell.lnxi.com> <1089729938.8696.115.camel@tubarao>
	<m3acy4j6dn.fsf@maxwell.lnxi.com> <1089732108.8696.127.camel@tubarao>
	<m3y8lndhho.fsf@maxwell.lnxi.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jul 2004 23:44:41 -0600
In-Reply-To: <m3y8lndhho.fsf@maxwell.lnxi.com>
Message-ID: <m3658rcfcm.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>, tharbaugh@lnxi.com
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ebiederman@lnxi.com (Eric W. Biederman) writes:

> Looking at where we are Dave has just reworked the code for handling multiple
> word sizes for reads and writes, and things are just starting to settle out.
> And since he is going to be gone he will be sending these changes to Linus
> later this week.


Ok. Where I am at.  

I have modified ichxrom so now is insanely flexibly.
It handles cfi and jedec parts.
It handles 1,2,4 byte bus widths.  (Since an LPC bus is packet
   based there is no natural bus width).

It still special cases Intel firmware hubs but that is disabled
when it is not dealing with them.  Both cases have been tested
both in 32bit and 64bit mode.

I have modified cfi_cmdset_0002 so that it retries in do_write_one_word.
For all of the other commands if an error occurs users can make
progress simply by retrying the command.   When do_write_one_word
fails all users can do is erase and rewrite the block.  Which
in the face of transient errors (especially from an SST chip)
can fail to make progress.

With those small fixes in place I have the mtd drivers working
for the primary cases I care about.  So I should be able
to use what Dave merges into 2.6. now :)

Actually making ichxrom handle nearly every NOR flash case under the
sun was less painful then I thought.  So unfortunately there is less
urgency to get the refactoring done now :(

However it is still on my TODO list so I will push it forward in a
little bit.

Eric
