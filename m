Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14puS3-0006e1-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 17:05:07 +0100
Message-ID: <3ADDBB5E.1ADE4AC1@daniel.com>
Date: Wed, 18 Apr 2001 11:05:50 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: rob@sysgo.de
CC: David Woodhouse <dwmw2@infradead.org>,
 	Alexander Melichenko <AlexanderM@lrpeople.com>, mtd@infradead.org
Subject: Re: Elan SC520 - problem with MTD
References: <01041716025800.02061@rob> <22300.987516491@redhat.com> <3ADC62AE.66B350ED@daniel.com> <01041815411600.00407@rob>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Robert Kaiser wrote:

> Hi Vipin,
>
> On Die, 17 Apr 2001 you wrote:
> >
> > This is the board that I am working with myself. I've got this working for
> > quite a while and have sent
> > my "physmap.c" file to a few folks personally (that's the original physmap.c
> > file from CVS hacked for the SC520 CDP- this was before there was
> > a physmap file in CVS for this board.)
> >
> > [snip]
> >
> > I suggest that whoever checked the sc520cdp.c file into CVS,
>
> .. That would be me ...
>
> >,at the very least
> > pick up the above comments
> > and include them as a warning, even if they don't want to reprogram the PAR at
> > the new and proper address
>
> Sorry, I wasn't aware of your work in this area when I wrote sc520cdp.c and
> decided to contribute it.

No problem. The fault was mine, that I did not do what you did in the first place
(i.e. make a
board specific file and check it in). Thanks for doing that.


> My main goal was to use the flash for a JFFS
> filesystem, so this strange mapping used by the BIOS wasn't a problem for me.

If you *always* access the FLASH banks after the board has been init by the BIOS,
then
you will never know that this insanity is going on, as it is behind the scenes and
completely transparent.

I ran into this problem, when I tried to init the flash manually while I had booted
a full Linux
system from the BIOS, then removed the BIOS and tried to boot the kernel (stored
into the flash
in the above step), directly from the FLASH bank0. This time, there was some
*other* custom code
that init the processor (and the PAR registers) and mapped the FLASH banks to a
more sensible address.


>
>
> > (I suggest that we reprogram the PAR regs).
>
> I tend to agree, though the fact that we are deviating from the BIOS's
> configuration this way makes me wonder if there should be a config option
> for it. OTOH, MTD already has more than enough config options already
> and I'm hesitant to add another one. (Just try to imagine how to write a
> one-paragraph entry for Configure.help to explain to people what this option
> does without scaring them away).

On further thought, I think that at the very least we should include a
"Warning" regarding
this issue in the sc520cdp.c file and include the PAR register setting code- albeit
commented out,
as an example.

I agree that we should NOT have a config option for this issue.

Vipin

>
>
> Rob
>
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO RTS GmbH
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
