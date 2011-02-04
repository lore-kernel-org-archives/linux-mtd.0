Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PlOmj-0003Mb-2H
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 16:45:26 +0000
Message-ID: <4D4C2D1D.5040302@keymile.com>
Date: Fri, 04 Feb 2011 17:45:17 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>			
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net><OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>			
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>			
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>			
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>		
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
In-Reply-To: <OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Michael Cashwell <mboards@prograde.net>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jocke

I tested your proposal to remove the unlock/lock for the
INVALIDATE_CACHED_RANGE() and without the addtional test
for unequal states, it worked in my environment.

Regards
Stefan

Am 02/04/2011 02:05 PM, schrieb Joakim Tjernlund:
> Stefan Bigler<stefan.bigler@keymile.com>  wrote on 2011/02/04 12:04:40:
>> Hi Jocke
>>
>> The code does the same, but is much nicer :-)
>> My test is also working again.
>>
>> Im on the way to find out why our old P30 (130nm) Flash worked
>> without the fix.
> Stefan,
>
> I think the bug lies in
> static int inval_cache_and_wait_for_operation(
> 		struct map_info *map, struct flchip *chip,
> 		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
> 		unsigned int chip_op_time, unsigned int chip_op_time_max)
> {
> 	struct cfi_private *cfi = map->fldrv_priv;
> 	map_word status, status_OK = CMD(0x80);
> 	int chip_state = chip->state;
> 	unsigned int timeo, sleep_time, reset_timeo;
>
> 	mutex_unlock(&chip->mutex);
> 	if (inval_len)
> 		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
> 	mutex_lock(&chip->mutex);
>
> Here we drop the lock and take it again. Someone may suspend the
> erase and do a read/write instead and put the chip some other state.
> Later we blindly do:
> 	for (;;) {
> 		status = map_read(map, cmd_adr);
> 		if (map_word_andequal(map, status, status_OK, status_OK))
> 			break;
> But we don't know what we are reading really.
>
> To test my theory, just remove the
> 	mutex_unlock(&chip->mutex);
> 	if (inval_len)
> 		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
> 	mutex_lock(&chip->mutex);
> and see what happens. This assumes that INVALIDATE_CACHED_RANGE is a NOP
> in your setup though.
>
>   Jocke
>
