Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaB9E-0002cp-Cx
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:30:33 +0000
Received: by iyn15 with SMTP id 15so3151519iyn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 11:28:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=b9tnk5tS9FZZ5WP4Nz9PUhMb02A@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTi=b9tnk5tS9FZZ5WP4Nz9PUhMb02A@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 14:28:21 -0400
Message-ID: <BANLkTi=baMZA4_xPw-aeDPm_NBV7uAQ+Dw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2011 at 13:37, Brian Norris wrote:
> I took a little look at doing this "kernel style," but I'm running
> into problems. It seems like this would be a little more difficult
> because of the less centralized nature of mtd-utils (in comparison
> with the kernel). Plus, I'm not very good with the GNU make system and
> don't wanna mess too deep into something that could easily break
> various people's build systems...

yes, it'd take a little bit of loving to make it happen

> Also, is it just me or is the mtd-utils build setup pretty ugly? Maybe
> I'm just used to how simplistic, unified, and informative the kernel
> build system is, whereas mtd-utils prints out all sorts of detailed
> info at the expense of *clearly* showing what it's doing.

you're used to the extra work that the kernel does to make the output
pretty.  if you look at the amount of make code required to accomplish
that, the mtd-utils code is actually a loooot simpler.

> Are the "ubi-utils" and "tests" meant to have the option of compiling
> separately from the other mtd-utils?
> Are these tools ever distributed separately? If not, do they need to
> be independently buildable? It looks to me like ubi-utils is dependent
> on first compiling "lib", but otherwise, they can all be built
> separately... Anyway, I think this kinda screws with the centralized
> VERSION thing above.

i wouldnt mind redoing some of the build system logic to be like the
kernel in that there is no recursion ... everything is included in the
top level make file and built there.  it'd probably simplify the pain
we've seen in the past where mtd-utils attempts to auto-build
out-of-tree when cross-compiling.

> Why is mtdinfo under ubi-utils? Perhaps it should be moved when it
> replaces flash_info? I think this is a fair interpretation of Item 3
> in the feature-removal plan...

i blame Artem
-mike
