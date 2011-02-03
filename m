Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PkzAL-0000aU-Ao
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 13:24:06 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
Date: Thu, 3 Feb 2011 08:24:53 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1ACF9E26-CE29-4288-96EA-A6FA8CDCFD3B@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 3, 2011, at 3:11 AM, Joakim Tjernlund wrote:

> Michael Cashwell <mboards@prograde.net> wrote on 2011/02/02 22:19:58:
>>=20
>=20
>> Note, the SR[7,2] bits its says are cleared by the command are not =
the error bits we're talking about. 7 and 2 are WSM-ready and =
erase-complete. The error bits are different ones. Maybe that's the =
confusion?
>=20
> Yeah, didn't read this thoroughly enough, the comment talks about the =
status bits though. Seems like the safe thing to do even though I don't =
recall anyone running into this problem before.

Agreed. I expect it would only matter if the intervening operation =
(likely a buffered write) itself both failed and left its own error bits =
in the register. For all I know that can't happen because the status =
clear is done as part of handling those errors.

> Send it as a separate git patch though.

Is this a nudge to separate the patches (eg: don't do unrelated things =
in one patch), or are you saying the patch format must be based on a git =
tree? I must admit lameness regarding using git as it was not part of =
the workflow I inherited.

>>     map_write(map, CMD(0xd0), adr);
>> +    /* some numonyx P30 parts have an apparent delay after starting =
or
>> +     resuming some commands. this is normally covered by the cache
>> +     invalidation done between the command and the start of reading
>> +     for the busy status bit to clear. but no such cache =
invalidation
>> +     is done when resuming and this allows the status-reading thread
>> +     awakened below to read the status too soon and think its =
operation
>> +     has finished when it fact its resumption is still underway. */
>> +    udelay(20);

>>> Perhaps the chip gets confused by this command?
>>> Have you tried to remove the Read Status command?
>>=20
>> I wondered about this too. But I recall seeing comments that said =
some particular Atmel part needed that command following an erase-resume =
in order to be in the Read-Status state the rest of the code expects. =
The comments also said that doing that command amounted to a NOP on =
other hardware, but maybe not. (!!)
>>=20
>> It could be that removing that command instead of adding a delay =
would make mine work but I'm doubtful. If the 0x70 command is messing =
things up I don't see how adding a delay would avoid it.
>=20
> Two things here:
> 1) Those comments about needing Read Status are very old may may not =
be true anymore.

Hmm. OK.

> 2) We need to explore the nature of this problem further. Adding a =
random delay isn't very appealing and may not fix the problem properly =
(it doesn't fix the problem for Stefan).

Yes, I agree. I'm not even sure Stefan's issue is the same as mine. His =
is a 1Gbit part I think.

>> I'm happy to try both of these and report back if you think it would =
help.
>=20
> Yes, as I am not convinced this is the correct fix and what the =
problem really is. I still think it is worthwhile checking with Numonyx =
as we have seen buggy flashes from them earlier. Are you sure these =
flashes was delivered directly from Numonyx?

Well no. I'm just doing software support for a group that is using =
Gumstix CPU boards. We are not involved in any way in the manufacturing =
of the hardware and have no access or visibility into such information. =
(Gumstix won't release the CPU board schematics even under an NDA.) For =
these reasons we have a custom board in the pipeline but it's not ready =
yet so for now this is what we have.

I must say I'm confused by Numonyx not altering some chip ID number in =
the CFI data for these new parts. Once we do find a solution, if it =
needs to be specific to these parts that's going to be harder to pull =
off.

More to come after my testing today.

-Mike
