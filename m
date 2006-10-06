Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVlpd-0004q5-OG
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 05:17:31 -0400
Subject: Re: Problem with developing Samsung K9F1G08U0A MTD driver
From: Thomas Gleixner <tglx@linutronix.de>
To: z l <zql@glomationinc.com>
In-Reply-To: <20061005232816.40455.qmail@web215.biz.mail.re2.yahoo.com>
References: <20061005232816.40455.qmail@web215.biz.mail.re2.yahoo.com>
Content-Type: text/plain
Date: Fri, 06 Oct 2006 11:22:19 +0200
Message-Id: <1160126539.9060.282.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-10-05 at 16:28 -0700, z l wrote: 
> If I was able to subsribe to the mailing list I would
> never write to you directly.  I already explained to
> you about it in my e-mail.  My main objective in that
> e-mail was to find out how I can subsrible with the
> web page not available and my previous attempts of
> subsribing by e-mail all failed.

I know that you apologized upfront for writing offlist, and that's the
only reason why I even bothered to answer you, but please go back to
your "Sent" folder and check the mail subject.

It reads: "MTD NAND FLASH & mailing list"

Simply your main concern was your NAND problem and nothing else.

I gave you advise how to subscribe to the mailing list and I gave you
the answer to your NAND question:

> Please use a community supported up to date kernel. See also
> 
> http://www.linux-mtd.infradead.org/source.html#kernelversions
> 
>         tglx

So you were able to subscribe and after you read this URL you go ahead,
omit the information about your vendor kernel intentionally and expect
that I would not notice.

> > Ah, if the community is ready to please your
> > expectations you are
> > willing to use a community kernel.
> It has nothing to do with pleasing or not.  Would you
> use something that is broken?

You start to annoy me.

1. The code in mainline is not broken at all. It works perfectly fine
and you insult really competent developers, who took the task to put it
there. Do you expect that the people, who you insult, will help you in
return for your obnoxiouness ?

2. incomplete != broken. You suffer from severe perceptual disturbance.

3. If it is broken for you, point it out and help to fix it.

4. If you are happy with the Cirrus code, use it and seek the help from
Cirrus. The paragraph about kernel versions on the mtd website makes
this entirely clear and we are not changing the terms for you.

5. Will Microsoft help you with problems you experience when using a
pirated copy of Windows ? The only difference is that Cirrus is allowed
to use our code and make whatever modifications they want, but this
right to copy, modify an redistribute does neither transfer our
responsibility for that code nor the right to abuse us as their unpaid
support team.

> > Go and blame Cirrus for their unwillingness to work
> > with the community.
> Maybe they are not actively involved in the
> development of latest kernel, but their code is open
> and available for anyone to pick and use.

Cirrus has _NEVER_ been involved with the community in any way, except
for unloading the problems with their shit^Hny code to us.

Are you expecting that I'm obliged to figure out what their pretious
"Cirrus Logic release 1.0.7" contains ?

Thats simply not the way it works. I wrote and maintain code which is in
the community codebase. I'm helping users with that code.

You decided to use Cirrus code for whatever reason. Go and get help from
Cirrus or pressure them to work with us.

> > You use code, which I can not look into and I'm not
> > interested to give
> > witchcraft debugging aid.
> The Cirrus Logic release is open source.  You can
> download it from arm.cirrus.com if you care to take a
> look.

I don't care and I'm not going to figure out where this "open source
Cirrus Logic release" is. Even if you give me a real download URL, I'm
not going to look at it. Have you the faintest idea how many of those
vendor kernels are out there ?

I care about the code which is in Linus' tree and the development code
in the mtd repository and I'm helping users to fix problems with said
code.

You have not the foggiest notion how Open Source works, but you think
you have a god given right to get our help.

All you get for your obnoxious behaviour is an entry in my killfile. 

	tglx
