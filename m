Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkPi2-0004jb-SU
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 12:00:47 -0400
To: tharbaugh@lnxi.com
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
	<m3u0wcj899.fsf@maxwell.lnxi.com> <1089729938.8696.115.camel@tubarao>
	<m3acy4j6dn.fsf@maxwell.lnxi.com> <1089732108.8696.127.camel@tubarao>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jul 2004 10:00:51 -0600
In-Reply-To: <1089732108.8696.127.camel@tubarao>
Message-ID: <m3y8lndhho.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thayne Harbaugh <tharbaugh@lnxi.com> writes:

> On Tue, 2004-07-13 at 09:04 -0600, Eric W. Biederman wrote:
> > Thayne Harbaugh <tharbaugh@lnxi.com> writes:
> 
> > > There's a short list of things that have been removed or changed
> > > significantly (although this is from memory and may not match the
> > > current code):
> > > 
> > > * read-back check of written data
> > 
> > I have a patch  for that already.  Since we are not checking any other
> > status bits.  At least verifying the data is correct is useful.  
> 
> Wonderful.
> 
> > > * retry of failed writes
> > 
> > This one is more interesting.  I don't know if it should be generic or we
> should
> 
> > just override do_write_one_word...
> > 
> > One way or another we will get this one back in there.
> 
> Good.

Looking at where we are Dave has just reworked the code for handling multiple
word sizes for reads and writes, and things are just starting to settle out.
And since he is going to be gone he will be sending these changes to Linus
later this week.

Since refactoring does not work well if I don't have a working code base
to start with. I will push for the appropriate fixes to the MTD command sets
so I know I am starting with a working base.  And then I will start refactoring
the command sets.

Eric
