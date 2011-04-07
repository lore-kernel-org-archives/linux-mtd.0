Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7vK8-0002Gn-7b
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 19:57:01 +0000
Received: by iwn36 with SMTP id 36so3291216iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 12:56:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTik9BcPTkgb_AwtmG6TPV1uwSxPP6A@mail.gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
	<BANLkTik9BcPTkgb_AwtmG6TPV1uwSxPP6A@mail.gmail.com>
Date: Thu, 7 Apr 2011 21:56:58 +0200
Message-ID: <BANLkTikp9OAXUFwcvV24x=d7ts3G3VR4yQ@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Leon, Mike, Russ,

Thanks for your feedback.

The program was modified initially because it erased the whole
partition even if the image only used part of it.
While working on it I noticed some additional improvements and
implemented them. I've been using the program
without any problem for about a year, and figured I should give my
changed back to the community.
As the code has been modified quite a while ago, I do not recall the
rationale behind all of the changes.

Wrt the comments:

> Dangerous on platforms that do not support non-natural alignments (ARM is one).
>
> Unless the alignment rules are enforced elsewhere?

Good point. I haven't really considered this. It is probably not too
difficult to enforce these constraints.

> doesnt this make an assumption about the values of an unwritten flash
> ?  iirc, this came up in the past and we opted to not blindly make
> that assumption.  probably best to put it behind a new command line
> option that the user has to opt into.

Yes, it assumes unwritten flash is 1 and writing turns it from 1 to 0.
I can easily make an option to opt into erase-only-if-needed

> your style throughout this patch is wrong.  this is lkml style, not
> GNU.  for example:
>  - no space between func and open paren
>  - space after commas
>  - braces after if/while/for/etc... need to be cuddled

Hm, yes, I noticed that I have been sloppy here with spaces and
commas. Peeking back at the original source that also had those
problems at some places.
What style did you exactly want? Do you have a pointer? Are the above
examples of what is wrong, or rules how it should be.
I'm aware of lkml style

Wrt cuddled: English is not my native language. Do you mean you want
the opening brace on the same line as the if ?

> ignoring the style issue you introduced, i dont see how your change
> from %1$s to %s is correct.  all you had to do was change PROGRAM_NAME
> to progname.

The change is tested and correct (I used progname twice).
As it stands this change was already pending on my list to submit for
quite a while. I guess the %1$s was replaced by %s because the libc I
tested this with did not support the 1$ position specifier.
Btw I am not too sure about the status of the positional modifiers and
how standard it is. It definitely was not in c89/c90.
Anyway, I can retest and change back if desired.

> i dont think they are.  looking at this code though, seems like it
> could be solved without needing to use 64/128 bit types and ugly
> casts.  i feel like it could be done with a clever memcmp or memchr or
> memmem.

The rationale for rolling my own test is because I wanted to test two
things in one loop:
- whether the new data is different from the existing data (if not no
action is needed)
- if the new data can be written without an erase cycle (so overwrite
the data, again this is under the assumption that erased bits are 1
and writing will turn 1 to 0 as needed).
Also memcmp and friends do not allow me to make this second test (at
least not easily), it would be something like (!src | dst) == 0
Programming the loop as I did was benched to be the fastest solution.

Btw I feel the program (also in the current form is perhaps not too
suitable for NAND flash as it does not contain any bad block detection
or handling (unless ofc there is a translation layer on top of mtd).
(please enlighten me if I am missing something here).

> I would caution against treating all 0xff blocks as being erased. A
> partially erased block will often return mostly 0xff, but some of the
> bits are random. If they return 1, you'll think all is well when it is
> not. This is why jffs2 has clean-markers. Secondarily, a partially
> erased block that randomly returns a few bits that match you data to
> be written would also be bad. In fact, no matter what stage power was
> lost during an erase cycle, no matter how marginal any percentage of
> the bits, your tool will smile and nod if it is writing all zeros.

Hm yes.
I did not consider power loss in a previous erase cycle.
Actually I assumed that 1's and 0's would be pretty solid and not
dangling in mid-air.
Taking that into account it is definitely a must to put it behind an option.

Taking that into account is it still worthwhile/interesting to have this patch?
Or should I see if I can modify the program in such a way that it only
erases what is needed
(the change was triggered by having to copy a kernel image and/or
initrd and/or rootfs to a partition that was quite overdimensioned)

Thanks all for your feedback!
Frans
