Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14psD6-00059x-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 14:41:32 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: Vipin Malik <vipin.malik@daniel.com>
Subject: Re: Elan SC520 - problem with MTD
Date: Wed, 18 Apr 2001 15:14:56 +0200
Content-Type: text/plain
References: <01041716025800.02061@rob> <22300.987516491@redhat.com> <3ADC62AE.66B350ED@daniel.com>
In-Reply-To: <3ADC62AE.66B350ED@daniel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
        Alexander Melichenko <AlexanderM@lrpeople.com>, mtd@infradead.org
MIME-Version: 1.0
Message-Id: <01041815411600.00407@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi Vipin,

On Die, 17 Apr 2001 you wrote:
> 
> This is the board that I am working with myself. I've got this working for
> quite a while and have sent
> my "physmap.c" file to a few folks personally (that's the original physmap.c
> file from CVS hacked for the SC520 CDP- this was before there was
> a physmap file in CVS for this board.)
> 
> [snip]
>
> I suggest that whoever checked the sc520cdp.c file into CVS,

.. That would be me ...

>,at the very least
> pick up the above comments
> and include them as a warning, even if they don't want to reprogram the PAR at
> the new and proper address

Sorry, I wasn't aware of your work in this area when I wrote sc520cdp.c and
decided to contribute it. My main goal was to use the flash for a JFFS
filesystem, so this strange mapping used by the BIOS wasn't a problem for me.

> (I suggest that we reprogram the PAR regs).

I tend to agree, though the fact that we are deviating from the BIOS's
configuration this way makes me wonder if there should be a config option
for it. OTOH, MTD already has more than enough config options already
and I'm hesitant to add another one. (Just try to imagine how to write a
one-paragraph entry for Configure.help to explain to people what this option
does without scaring them away).

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
