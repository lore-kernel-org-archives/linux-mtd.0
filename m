Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oy3qT-0004sY-JI
	for linux-mtd@lists.infradead.org; Tue, 21 Sep 2010 14:29:22 +0000
Received: by fxm4 with SMTP id 4so1886196fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Sep 2010 07:29:20 -0700 (PDT)
Subject: Re: latest MTD-utils
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <87sk131977.fsf@macbook.be.48ers.dk>
References: <AANLkTin+Y2YD3w4MfdTmQkRyB_UZD8pY51ci4pTQHacB@mail.gmail.com>
	<1285053950.7512.5.camel@localhost>
	<871v8n2osc.fsf@macbook.be.48ers.dk>
	<1285077063.7512.120.camel@localhost>
	<1285077268.7512.121.camel@localhost>
	<87sk131977.fsf@macbook.be.48ers.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Sep 2010 17:27:32 +0300
Message-ID: <1285079252.7512.136.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bruno Cornec <bruno@project-builder.org>, linux-mtd@lists.infradead.org,
	twebb <taliaferro62@gmail.com>, David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-21 at 16:07 +0200, Peter Korsgaard wrote:
> >>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:
> 
> Hi,
> 
>  Artem> Peter, why would not you make a make tarball target, BTW? Sorry,
>  Artem> may be you explained, but I forgot.
> 
> You mean why don't I just checkout from git and make a tarball myself?
> 
> Tarballs are pretty much the standard for source releases, and
> source-based metadistributions (like Buildroot that I maintain) normally
> are optimized for tarballs rather than semi-random git snapshots
> (E.G. mirroring, automatic handling, ..).
> 
> And then there's the issue about people checking the ftp and not
> noticing that there's actually a new stable release out instead of the
> old 1.3.1

It is not too difficult to provide tarball, but this is something
developers do not care about, they develop. Packagers do care, and it is
saner when packagers do this, not developers.

I was in LinuxCon Brazil this year, and there was this presentation:
http://events.linuxfoundation.org/2010/linuxcon-brazil/cornec

where bruno said exactly the same. And he was promoting his project
which claims to be able to pick sources from anywhere - git, svn,
whatever.

So the question is, why Buildroot cannot adjust to the reality (which is
that developers in average do not care about tarballs) and cannot be
improved?

I'm not competent in the packaging area, though. Just a logical thought.
Also CCed Bruno, may he'll be interested to know his presentation was
listened to :-) Bruno, the beginning of the conversation is here:
http://lists.infradead.org/pipermail/linux-mtd/2010-September/032164.html

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
