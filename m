Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PlLfM-0001uJ-S9
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 13:25:37 +0000
In-Reply-To: <OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>				<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>	<4D4AD9ED.8060104@keymile.com>
	<4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
Message-ID: <OF07EAD4C4.CCC2BC5C-ONC125782D.0049830D-C125782D.0049C08C@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 4 Feb 2011 14:25:34 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	stefan.bigler@keymile.com, Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Stefan Bigler <stefan.bigler@keymile.com> wrote on 2011/02/04 12:04:40:
> >
> > Hi Jocke
> >
> > The code does the same, but is much nicer :-)
> > My test is also working again.
> >
> > Im on the way to find out why our old P30 (130nm) Flash worked
> > without the fix.
>
> Stefan,
>
> I think the bug lies in
> static int inval_cache_and_wait_for_operation(
>       struct map_info *map, struct flchip *chip,
>       unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
>       unsigned int chip_op_time, unsigned int chip_op_time_max)
> {
>    struct cfi_private *cfi = map->fldrv_priv;
>    map_word status, status_OK = CMD(0x80);
>    int chip_state = chip->state;
>    unsigned int timeo, sleep_time, reset_timeo;
>
>    mutex_unlock(&chip->mutex);
>    if (inval_len)
>       INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
>    mutex_lock(&chip->mutex);
>
> Here we drop the lock and take it again. Someone may suspend the
> erase and do a read/write instead and put the chip some other state.
> Later we blindly do:
>    for (;;) {
>       status = map_read(map, cmd_adr);
>       if (map_word_andequal(map, status, status_OK, status_OK))
>          break;
> But we don't know what we are reading really.
>
> To test my theory, just remove the
>    mutex_unlock(&chip->mutex);
>    if (inval_len)
>       INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
>    mutex_lock(&chip->mutex);
> and see what happens. This assumes that INVALIDATE_CACHED_RANGE is a NOP
> in your setup though.
>
>  Jocke

Noticed this too:
	if (sleep_time >= 1000000/HZ) {
			/*
			 * Half of the normal delay still remaining
			 * can be performed with a sleeping delay instead
			 * of busy waiting.
			 */
			msleep(sleep_time/1000);
			timeo -= sleep_time;
			sleep_time = 1000000/HZ;
	} ...

This is broken and may cause needless delays, possibly underflow timeo
too.

 Jocke
