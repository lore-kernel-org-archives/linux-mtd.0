Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvjXT-0001qu-Nr
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 05:28:41 +0000
Received: by gxk2 with SMTP id 2so5077286gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 22:28:36 -0700 (PDT)
Subject: Re: [RFC 4/5] mtd: move mtd_oob_mode_t to shared kernel/user space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 08:30:23 +0300
In-Reply-To: <CAN8TOE97XijzxpdjF4MHMzGhoAYw7VaLaYSD-HEP-UYUUCf13w@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-5-git-send-email-computersforpeace@gmail.com>
	<1314003028.2644.80.camel@sauron>
	<CAN8TOE97XijzxpdjF4MHMzGhoAYw7VaLaYSD-HEP-UYUUCf13w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314077429.2645.31.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-22 at 14:43 -0700, Brian Norris wrote:
> On Mon, Aug 22, 2011 at 1:50 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> >> +typedef enum {
> >> +     MTD_OOB_PLACE,
> >> +     MTD_OOB_AUTO,
> >> +     MTD_OOB_RAW,
> >> +} mtd_oob_mode_t;
> >
> > Could we get rid of this typedef and use anonymous enum instead:
> >
> > enum {
> >        A,
> >        B,
> > };
> >
> > Indeed, we do not need it, and we do not want to pollute the user-space
> > namespaces unnecessarily.
> 
> Well, we do *use* the typedef in a few kernel structs, and we will use
> it in user space as well. So we may run into issues with 32-bit vs.
> 64-bit integers if we just stick with an int-based type, right?

I just find typedefs unreadable. Every time you see it - you need to
look at the definition, find it, distract. And C does not do any type
checking anway, so typedefs for enums really make little sense. If you
really do not want to use int, let's use 'enum blah' type, which is at
least readable - when you see it - you know it is just an integer, and
you do not have to find the definition.

Anonymous enums is my preference. They are just like macro definition,
but with assumed type, and potentially debugger-friendly.

So, to conclude:

1. typedefs for enums make no sense a all - C does not do any strict
type-checking anyway, and typedefs only make reading code more
difficult.

2. using 'enum blah' is more sensible - it does not hurt readability too
much at least.

3. IMHO, and I even dare to say that many kernel gurus would agree, if
we are talking about a simple enum with just few constants inside -
anonymous enum is the best - the code is simpler and more readable.

It is not that difficult to remove in-kernel usage of typedefs, I think.
VS user-space - the only user we care about - mtd-utils - has its own
copy of the headers, and if we update the header files there, we can
amend mtd-utils.

32/64 problems - what do you mean? enumeration = 'int' which is always
32 bits in all architectures Linux supports.

References:
1. C99 standard, section 6.4.4.3: enumeration = int
2. C99 section 6.2.5, marker 20: about enum = just definition of a
constant and _not_ a typed form.

So, I'd be happy with 3, can live with 2, and dislike 1 very much :-)

> Also, I'm pondering the question: do we need to worry about the
> underlying numbering for such an enum? I believe there it is
> theoretically possible for different compilers to choose a different
> numbering scheme, potentially making user-compiled software
> incompatible with the internal kernel binary. Perhaps to be safe we
> could just do:
> 
> enum {
>      MTD_OOB_PLACE = 0,
>      MTD_OOB_AUTO = 1,
>      MTD_OOB_RAW = 2,
> };

I cannot refer to a section in a standard, but I am sure unitialized
tags will start with 0 reliably. But yes, it is much less error-prone to
initialize the tags explicitly, because it makes it a bit more difficult
to make a stupid mistake by adding a new constant and change values of
other constants.

> Or instead, maybe we should just switch to a __u32 type and some #defines...

Anonymous enum is almost that, you can just treat it as int32_t.

> Sorry if this is a lot of thinking out loud here :)

Yeah, least significant topics usually cause most discussions - I was
told recently by a colleague that this is called "bike shedding". Notice
how much I wrote comparing to more important posts of yours :-)

-- 
Best Regards,
Artem Bityutskiy
