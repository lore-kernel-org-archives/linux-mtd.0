Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PlP8l-0003a6-JK
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 17:08:12 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
Date: Fri, 4 Feb 2011 12:09:01 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>			
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 4, 2011, at 8:05 AM, Joakim Tjernlund wrote:

> Stefan,
>=20
> I think the bug lies in
> static int inval_cache_and_wait_for_operation(
> 		struct map_info *map, struct flchip *chip,
> 		unsigned long cmd_adr, unsigned long inval_adr, int =
inval_len,
> 		unsigned int chip_op_time, unsigned int =
chip_op_time_max)
> {
> 	struct cfi_private *cfi =3D map->fldrv_priv;
> 	map_word status, status_OK =3D CMD(0x80);
> 	int chip_state =3D chip->state;
> 	unsigned int timeo, sleep_time, reset_timeo;
>=20
> 	mutex_unlock(&chip->mutex);
> 	if (inval_len)
> 		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
> 	mutex_lock(&chip->mutex);
>=20
> Here we drop the lock and take it again. Someone may suspend the
> erase and do a read/write instead and put the chip some other state.

That's where I get confused. It's true that another thread could do that =
but wouldn't it have to bracket its operation with calls to get_chip() =
and put_chip()? Those actually do the suspend and resume. I'm certainly =
seeing erases being suspended to do a buffered write and then being =
resumed.

A properly done suspend/resume should leave the hardware is the same =
state it was in before hand. So if get_chip/put_chip are not doing that =
then that's where the problem is.

Originally I thought a udelay(20) was needed after the resume command =
was sent. What I've most recently seen is that just doing one map_read() =
of status (and discarding the result) is enough to avoid my error:

	switch(chip->oldstate) {
	case FL_ERASING:
		chip->state =3D chip->oldstate;
		/* What if one interleaved chip has finished and the
		   other hasn't? The old code would leave the finished
		   one in READY mode. That's bad, and caused -EROFS
		   errors to be returned from do_erase_oneblock because
		   that's the only bit it checked for at the time.
		   As the state machine appears to explicitly allow
		   sending the 0x70 (Read Status) command to an erasing
		   chip and expecting it to be ignored, that's what we
		   do. */
		map_write(map, CMD(0xd0), adr);
		map_write(map, CMD(0x70), adr);
		(void) map_read(map, adr);	// <<<<----- added
		chip->oldstate =3D FL_READY;
		chip->state =3D FL_ERASING;
		break;

I'm still not sure why. My guess is that it's timing (since udelay(20) =
in the same spot also works for me) but being timing-sensitive is making =
it hard to pin down. Adding printk()s also often makes it not happen.

-Mike
