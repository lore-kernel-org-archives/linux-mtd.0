Received: from mail-ia0-f180.google.com ([209.85.210.180])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkpiS-0007FT-B1
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2012 05:27:45 +0000
Received: by mail-ia0-f180.google.com with SMTP id t4so181525iag.39
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2012 21:27:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <loom.20121217T021112-577@post.gmane.org>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
 <20120904144826.7b9b7518@halley> <5046B504.6000608@freescale.com>
 <loom.20121217T021112-577@post.gmane.org>
Date: Mon, 17 Dec 2012 21:27:40 -0800
Message-ID: <CAN8TOE_E1CADQ3NBg9jEG7dOkK=r=sh=0aDZPNi9tZBjqC5ihw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
From: Brian Norris <computersforpeace@gmail.com>
To: Christopher Cordahi <christophercordahi@nanometrics.ca>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(re-include others on CC)

On Sun, Dec 16, 2012 at 5:11 PM, Christopher Cordahi
<christophercordahi@nanometrics.ca> wrote:
> Huang Shijie <b32955 <at> freescale.com> writes:
>> =D3=DA 2012=C4=EA09=D4=C204=C8=D5 19:48, Shmulik Ladkani =D0=B4=B5=C0:
>> >
>> > My POV is that sorting and verification is not needed, is troublesome,
>> > and might affect users in ways they don't expect.
>> >
>> > So far, mtdparts commandline parsing has been very lenient and liberal=
.
>> > I think we should keep this approach; give the user the flexibility,
>> > he'll be responsible to provide meaningful cmdline parts for his
>> > system.
>> >
>> > Actually, Huang's initial complaint was that 'parse_cmdline_partitions=
'
>> > was too strict - the truncated partition was not registered!
>> >
>> > Now, philosophy aside, let's talk about some usecases that might break=
.
>> >
>> > I remember overlapping partitions (more precisely, partition that is a
>> > subset of another) being common in some embedded systems, where the
>> > "rootfs" and "kernel" partitions are a subset of the "overall image"
>> > partition.
>> > Why break this? if users enjoy the flexibility, and careful not to
>> > create silly partitions, I'm in favor of keeping the flexibility.
>> >
>> > Same goes for sorting.
>> > If one has a system hacked to work with mtd0 hardcodedly, but mtd0's
>> > physical location is somewhere at the end of the device, why reorder t=
he
>> > partitions enumeration affecting this system?
>> >
>> > I'd say keep it simple and flexible.
>> yes, it's really simple and flexible.
>
> Is it agreed that sorting is not necessary and will not be implemented?
> If so are there objections to me modifying the documentation to indicate
> that out of order partitions is part of the supported design?

I don't object but rather would welcome the documentation. I think the
consensus was that there were real reasons to allow unsorted
partitions at least, and maybe even overlapping partitions.

> In my embedded distribution, I would like to introduce a MTD partition
> at the end of the list to not affect existing hardcoded MTD numbers.

FWIW, my embedded systems make use of both out-of-order and
overlapping partitions. I don't see why they must be sorted, and
currently, overlapping is useful for me in exactly the scenarios given
above (rootfs + kernel as subsets of entire_device).

> Although my out of order partitions worked, I couldn't find any
> documentation indicating it was a supported feature.  This thread with
> Artem's support for sorting got me worried.
>
> If the only reason for sorting is to prevent overlapping partitions,
> I think this can be written just as efficiently without a sort although
> Shmulik also gives a reason why this restriction should not exist.
> I'd prefer to accept that task rather than have to handle changing
> MTD numbers.
>
>> But I think it's not wise to export the 0-size partition to user.
>> The user may confused at this.
>
> Although I just submitted a patch to improve this, personally I think
> if a user specifies a zero sized partition, they should get it.  Or if
> it's inherently incorrect I think it should be an error.  Similarly
> I'd expect the same for truncated partitions, either provide the size
> specified or error.  Since I don't ever foresee using either of these
> two features I don't have any objections to current situation.  These
> are just my $0.02

Well, the truncated partition is helpful sometimes. Perhaps an old
flash partition layout is used when swapping in a different, smaller
NAND; the truncated partition allows the system to still work, with a
nice warning in case the user wants to fix it.

Brian
