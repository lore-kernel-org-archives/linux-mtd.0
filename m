From: David Woodhouse <dwmw2@infradead.org>
To: zhao <forrest.zhao@intel.com>
In-Reply-To: <42B11054.4020509@intel.com>
References: <8126E4F969BA254AB43EA03C59F44E840263CEAE@pdsmsx404>
	<1118827313.22181.52.camel@hades.cambridge.redhat.com>
	<42B11054.4020509@intel.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jun 2005 11:12:56 +0100
Message-Id: <1118916776.5497.33.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-16 at 13:38 +0800, zhao wrote:
>  Would you please give me some information about the difference
>  between the JFFS2 in 2.4 kernel and the one in 2.6 kernel?

JFFS2 in the 2.4 kernel, as with everything else in the 2.4 kernel, is
old but stable code. It lacks the new features -- NAND flash support,
the mount time improvements due to delayed scanning, etc. 

The whole point of 2.4 is that ought to be _stable_, and undergoes very
little change. Some changes were made in 2.4.20-2.4.22 timescale to the
VFS which fixed some problems with garbage collection by adding
ilookup(), etc. Since then I don't recall having to touch it.

>  Will the enhancement and new features of JFFS2 in 2.6 kernel be
>  back-ported to 2.4 kernel?

Absolutely not. The whole point of the 2.4 kernel is that it's ancient
and _stable_. To start backporting new features and 'improvements' from
the 2.6 kernel would be entirely bizarre -- it would defeat the object
of having a stable, frozen kernel in the first place.

2.4 is not for development. If you're willing to change MTD and JFFS2 in
an ancient 2.4 kernel, you might as well just update wholesale to 2.6
and have done with it -- you're just making pointless work for yourself
if you do extensive _development_ on a 2.4 kernel.

It used to be technically possible to use the latest JFFS2 code in a 2.4
kernel -- it probably still is without too much work. But that doesn't
make it any less of an insane proposition, which is presumably why
nobody's really interested in doing it. The latest code isn't tested at
all with the 2.4 VFS, and the details of the 2.4 kernel are not taken
into consideration when designing it. That's basically been the case for
a long time, but we only drew a line under it and said "no more 2.4"
when it finally became _obvious_. 

Why do you ask the question? Let's back up a step and look at what
you're trying to do. 

When choosing a kernel you basically have three options -- you could use
2.4 as-is, you could use 2.6, or you could backport certain features
from 2.6 to 2.4. 

Using 2.4 could make some sense, if it does what you need -- it is very
well tested and stable code. If you're doing _minor_ updates to a
product which already uses 2.4 successfully, it's the best answer.

Using 2.6 makes a lot of sense too -- it's also stable now, and has many
shiny new features and improvements. It's what you should be using for
any new projects.

Using some 2.6 stuff backported to 2.4 will result in a mix-and-match
code base of your own devising which has had _less_ testing and can be
expected to be _less_ stable than the 2.6 kernel. In addition to which,
you'll have fewer features and improvements than the 2.6 kernel. You
lose out on _both_ stability and features by taking that approach -- in
the general case it makes _no_ sense whatsoever. Just say no.

The 2.4 kernel isn't stable because '2' and '4' are magic numbers. It's
stable because it's old and tested code. To make extensive modifications
to it and still keep using it "because it's the stable kernel" is
utterly insane.

Don't get me wrong -- I don't think people should immediately stop
_using_ 2.4. It's just that people certainly shouldn't be _developing_
on 2.4. If it works for you, that's great. But it ain't broke. Don't fix
it.

>  Hope I comply with the netiquette this time :)

You do -- thanks for making the effort to fix whatever was causing the
problem.

I'm sorry to be so harsh about it, but it is important for people to
co-operate and to make sure their mail is easy to deal with. It's
actually quite important to make sure that mail is grouped correctly
into threads, and your mail is associated with the mail to which you're
replying. Likewise, trying to decipher a top-post or HTML mail is
suboptimal -- it may only take a few seconds more than a normal mail,
but those few seconds are multiplied by _every_ reader who finds it
harder to deal with the mail in question.

In my case, 'a few seconds' is actually quite a large proportion of the
amount of time I have each week to glance at the linux-mtd mailing list.
Hopefully that situation will improve in the fairly near future as the
project I'm working on draws nearer to completion, and I'll be able to
spend a little more time on MTD again. Thomas, Jörn, Artem and others
are doing such a fine job in my 'absence' that I'm worried they'll
realise they can just do without me entirely ;)

-- 
dwmw2
