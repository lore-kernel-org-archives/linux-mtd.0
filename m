Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmTHH-00019L-5m
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 15:45:24 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OFFF2C6D34.91E5D6C3-ONC1257830.005200CA-C1257830.00528914@transmode.se>
Date: Mon, 7 Feb 2011 10:46:22 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>		
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net> <OF2C1ABD39
	<4D5005E4.1040506@keymile.com>
	<OFFF2C6D34.91E5D6C3-ONC1257830.005200CA-C1257830.00528914@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: Holger brunck <holger.brunck@keymile.com>, stefan.bigler@keymile.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 7, 2011, at 10:01 AM, Joakim Tjernlund wrote:

> Stefan Bigler <stefan.bigler@keymile.com> wrote on 2011/02/07 =
15:47:00:
>>=20
>=20
>> I run the test on my side with the patches proposed with and without =
barrier().
>> Both worked without problems.
>=20
> Thanks for testing.

So that means moving the chip state while loop first solves the problem =
for both of you. That's good news and makes it more likely that you are =
seeing the same issue. I'm OK that it doesn't fix my issue. It's seemed =
different from the beginning.

>> My workspace has now the following patches:
>>=20
>> 1) clear status before suspend

No, before erase resume.

>> ------------------------------
>> +    /* numonyx data sheet clearly says to always reset the status =
bits
>> +       before resuming a suspended erase. not doing so results in
>> +       an ambiguous mixture of status bits once the command ends. */
>> +    debug_map_write(map, CMD(0x50), adr);
>> +    debug_map_write(map, CMD(0xd0), adr);
>=20
> The 0xd0 seems should not be there, its already in place?

I think he meant the 0xd0 line to be context, not added. So maybe the + =
was wrong?

My current workaround from my problem is to do a throw-away status read =
"(void) map_read(map, addr);" after that 0x50, 0xd0, 0x70 sequence.

Since no one else is seeing my problem I expect it's some issue with my =
specific batch of chips. Ugh.

> it does seem like a good idea to add a Clear Status to be sure you =
won't end up with error bits set just before resume.
> This is a separate patch though. Does your test case work without this =
patch and only my patch applied?
>=20
>> 2) compare chip>state and chip_state before touching the chip
>> ------------------------------------------------------------
>=20
> I plan to submit this one shortly, if you and Michael could Ack. it =
when I do, that would be great.

Happy to test and ack when it arrives.

-Mike
