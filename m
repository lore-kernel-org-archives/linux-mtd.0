Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SX5Eg-0001E3-G1
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 06:39:55 +0000
Received: by ghbf11 with SMTP id f11so1239710ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 23:39:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120522171023.GA2372@parrot.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
 <20120522171023.GA2372@parrot.com>
Date: Tue, 22 May 2012 23:39:51 -0700
Message-ID: <CAN8TOE90vWS713_vKNwkBDMBPbEiz10R0oiawnRVgmTYFRPh0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
From: Brian Norris <computersforpeace@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>,
 Johan Gunnarsson <johan.gunnarsson@axis.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, May 22, 2012 at 10:10 AM, Ivan Djelic <ivan.djelic@parrot.com> wrot=
e:
> On Tue, May 22, 2012 at 09:52:22AM +0100, Johan Gunnarsson wrote:
>> > -----Original Message-----
>> > From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
>> > Sent: den 22 maj 2012 09:53
>> > To: Johan Gunnarsson; Brian Norris
>> > Cc: linux-mtd@lists.infradead.org; Jesper Nilsson
>> > Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
>> > nand_wait{_ready, }
>
> (...)
>
>> > Si this function waits for the chip, but if we cannot access the
>> > "ready"
>> > pin - it waits for 400msecs? Where this number 400 comes from? Why not
>> > 500? How many chips we have which do not provide "dev_ready()"
>> > function?
>
> Current NAND devices require approximately 1-3 ms per block erase, and 10=
0-200 us per page program operation.
> But I think this timeout is only useful to detect and recover from broken=
 hardware: IMHO there is no point in
> trying to "optimize" the timeout delay to 20ms or 400ms depending on whic=
h operation is being done (program or erase).
>
> Why not simplify and just use a single 1s (1000ms) timeout ?
>
>> > Can we simplify this function and assume everyone has "dev_ready()" an=
d
>> > add BUG_ON(!chip->dev_ready) - could you make a small research ? Or ca=
n
>>
>> The drivers/mtd/nand/h1910.c driver sets dev_ready to NULL on init. The =
others seem to have dev_ready implementations.

Not true: there are several drivers which do not have dev_ready, but
this is also because they are controller-based, so they provide their
own cmdfunc as well, mostly avoiding the nand_wait_ready stuff.
(Drivers: denali.c, docg4.c, my out-of-tree driver, ...)

Note: another use of nand_wait_ready is in nand_do_read_ops and
nand_do_read_oob, under the following condition:
    if (!(chip->options & NAND_NO_READRDY)) {
Isn't NAND_NO_READRDY no longer needed, since I killed autoincrement?
(i.e., we *always* "do not support autoincrement", as its comment says
in nand.h) So if we kill this option, we can kill the only use of
nand_wait_ready outside of cmdfunc(); this brings us closer to being
able to using BUG_ON(!chip->dev_ready). I'll send a patch for this,
and you guys can comment.

>> Actually, it's worse than that. If dev_ready is NULL (as in the h1910.c =
case) we'll crash the kernel, right?

No, I don't think so. It looks like nand_wait_ready is never called
when dev_ready is NULL.

>> >
>> > My point is that this stuff ancient horror which needs love and
>> > cleaning
>> > up. Your does not make it less scary. I'd prefer to first clean the
>> > whole thing up, and then fix it.
>
> I agree it needs some cleaning; here are a few things I have noticed:

Even though I'm mostly not a user of this code, I agree :)

> * Some patterns are repeated:
> =A0 =A0 =A0 =A0/* Apply delay or wait for ready/busy pin */
> =A0 =A0 =A0 =A0if (!chip->dev_ready)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0udelay(chip->chip_delay);
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nand_wait_ready(mtd);

I'm going to kill this pattern, I think.

> * the udelay() fallback should probably be phased out if only one driver =
(h1910) depends on it because it does not define chip->dev_ready() ?

Clarification: only one driver does leaves both chip->dev_ready and
chip->cmdfunc NULL, right?

> What do you think ? Any suggestions ?
> I'm willing to submit patches if we reach a consensus on this,

Feel free to send a patch; it's probably easier to talk more
concretely about a patch that implements your (seemingly reasonable)
suggestions, and then provide comments based on concrete ideas.

Brian
