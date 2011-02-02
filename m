Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkk6a-0002VY-NO
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 21:19:14 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=windows-1252
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
Date: Wed, 2 Feb 2011 16:19:58 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
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

On Feb 2, 2011, at 3:12 PM, Joakim Tjernlund wrote:

>> That difference means there's very little time between the resume =
command write and the status read. The apparent result is that the WSM =
is reported "not busy" when in fact the resumption is still being acted =
upon. The code misinterprets this to mean the resumed erase is complete =
when it is not and subsequent commands then go fully off the rails as a =
result.
>=20
> Please post patches inline, much easier to comment on them.

OK. Sorry about that!

> Here is the relevant part I am interested in:
>=20
> +++ linux-2.6.35.7-arm-gum-mod/drivers/mtd/chips/cfi_cmdset_0001.c  =
2011-01-27 16:11:27.000000000 -0500
> @@ -1004,7 +1004,19 @@ static void put_chip(struct map_info *ma
>       sending the 0x70 (Read Status) command to an erasing
>       chip and expecting it to be ignored, that's what we
>       do. */
> +    /* numonyx data sheet clearly says to always reset the status =
bits
> +     before resuming a suspended erase. not doing so results in
> +     an ambiguous mixture of status bits once the command ends. */
> +    map_write(map, CMD(0x50), adr);
> hmm, I found this:
> 8.5
> Program Resume
> The Resume command instructs the device to continue programming, and
> automatically clears Status Register bits SR[7,2]. This command can be =
written to any
> address. If error bits are set, the Status Register should be cleared =
before issuing the
> next instruction. RST# must remain deasserted (see Figure 32, =93Buffer =
Program
> Flowchart=94 on page 74).
>=20
> Which I think disagrees with your statement. How did you arrive to =
this conclusion?

There are several statements in flight. If you refer here to my claim =
that we should clear the status register before resuming then it's "If =
error bits are set, the Status Register should be cleared before issuing =
the next instruction." I don't see the point in reading the status and =
doing that clear conditionally. Clearing them when they are already =
clear is OK.

My point was just that the code is doing a resume and did not clear the =
error bits as the data sheet said it should.

Note, the SR[7,2] bits its says are cleared by the command are not the =
error bits we're talking about. 7 and 2 are WSM-ready and =
erase-complete. The error bits are different ones. Maybe that's the =
confusion?

>      map_write(map, CMD(0xd0), adr);
> +    /* some numonyx P30 parts have an apparent delay after starting =
or
> +     resuming some commands. this is normally covered by the cache
> +     invalidation done between the command and the start of reading
> +     for the busy status bit to clear. but no such cache invalidation
> +     is done when resuming and this allows the status-reading thread
> +     awakened below to read the status too soon and think its =
operation
> +     has finished when it fact its resumption is still underway. */
> +    udelay(20);
>=20
> I don't follow your reasoning here. This Read Status command isn't =
saved anywhere so how can the code get confused later on?

It's not that the read happens here and is saved. It happens in the =
thread awakened a few lines later. That thread went to sleep while =
waiting for its WSM operation to complete so it's in a loop reading and =
testing that. The first thing it does on wake up is read the WSM status.

My point is that in the case of erase-resume there is much less real =
time between the write of the resume command and the later read of the =
status register than there is when starting an erase or program =
operation anew. This is because the latter perform a cache flush that =
takes time.

My failures were caused by the erase-resume status read "seeing" a =
non-busy WSM. Adding a 20=B5s delay before that read (actually after the =
command write, but it amounts to the same thing) prevents this from =
happening. By the time awakened "wait-for-completion" code does its =
first status read it sees the WSM as busy as it should until the erase =
actually finishes.

The effect of the added delay is to make the erase-resume path's timing =
similar to the erase and buffer write paths that take more time because =
of their cache invalidate call. IOW, it explains why only the resume =
path has a problem when starting new erase or program commands work OK.

> Perhaps the chip gets confused by this command?
> Have you tried to remove the Read Status command?

I wondered about this too. But I recall seeing comments that said some =
particular Atmel part needed that command following an erase-resume in =
order to be in the Read-Status state the rest of the code expects. The =
comments also said that doing that command amounted to a NOP on other =
hardware, but maybe not. (!!)

It could be that removing that command instead of adding a delay would =
make mine work but I'm doubtful. If the 0x70 command is messing things =
up I don't see how adding a delay would avoid it.

> What if you move the udelay after the Read Status?
>=20
>      map_write(map, CMD(0x70), adr);
>      chip->oldstate =3D FL_READY;
>      chip->state =3D FL_ERASING;

No, I didn't try that. Since the status read has not actually happened =
yet it didn't occur to me. If my theory is right, doing the delay after =
the 0x70 would also work since it still separates in real time the =
command write and status read.

I'm happy to try both of these and report back if you think it would =
help.

-Mike
