Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmBvU-0003Qb-O2
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 21:13:45 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OFE5450B1B.EA07E31D-ONC125782F.005D4D25-C125782F.00601FE6@transmode.se>
Date: Sun, 6 Feb 2011 16:13:40 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net> <OF42EF
	<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>
	<OFE5450B1B.EA07E31D-ONC125782F.005D4D25-C125782F.00601FE6@transmode.se>
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

On Feb 6, 2011, at 12:29 PM, Joakim Tjernlund wrote:

> Michael Cashwell <mboards@prograde.net> wrote on 2011/02/06 16:49:53:
>=20
>> That's clearly what's happening in Stefan's trace when thread 465 =
writes 0xe8 and the next write is 0x70 by thread 209. Such a sequence is =
absolutely illegal (for the flash) and the latter thread is the problem. =
If we could get a stack trace for that map_write 0x70 I think we'd find =
the thread awoke and touched the chip without verifying the state first. =
The question is why.
>=20
> Without my patch it is clear that you do end up with this problem. The =
first time one enter the for(;;) loop the driver reads out status from =
the chip before checking chip->state. This of course assumes that =
dropping the lock earlier may cause a schedule. So far Stefans tests =
indicates this to be true.

Yes, it was your patch and his log that lead me down that path!

>> One last idea.
>>=20
>> The whole for(;;) loop in inval_cache_and_wait_for_operation() looks =
odd to me. Continuing with your idea of moving the chip->state while =
loop first, I see other problems. It seems to me that anywhere we drop =
and retake the chip mutex the very next thing needs to be the state =
check loop. Any break in holding that mutex means we must go back to the =
top and check state again.
>>=20
>> I don't think the code as written does that. I have a completely =
reordered version of this function. (It didn't fix my issue but I think =
mine is something else.) On Monday I'll send that to you so you can =
consider it.
>=20
> Yes, it is a bit odd. In addition to my patch one could move the erase =
suspend tests before the if(!timeo) test.

Precisely. I suspect you may well already have my reordered version. :-)

>>> Oh, one more thing, possibly one needs to add cpu_relax() or similar =
to force gcc to reload chip->state in the while loop?
>>=20
>> I was also wondering about possible gcc optimization issues. I'm on =
4.5.2 and that worked for me with the 2003 flash part. The same binaries =
fail with the 2008 parts, so, I don't know.
>=20
> Very recent gcc, I am 3.4.6 but recently I began testing a little with =
4.5.2. I do think I will wait for 4.5.3

I tried 4.5.1 but it failed for other reasons. I submitted bug reports =
to gnu and a fix appeared (finally) in 4.5.2. It's been good so far but =
I'm always mindful of that issue.

Staying current is a two edge sword. In general, later gccs have better =
code analysis and warnings which are valuable even if we ship using an =
older version.

>> Keep in mind that chip->state is not a hardware access. It's just =
another struct member. And I think that the rules are that any function =
call counts as a sequence point and gcc isn't allowed to think it knows =
what the result is and must reload it.
>>=20
>> Lastly, consider the direction of the behavior. If we're in the =
state-check while loop then we got there because the two things were NOT =
equal. If an optimization error is causing a stale value to be compared =
wouldn't the observed behavior be that it remains not equal? (If it's =
not reloaded then how could it change?)
>>=20
>> I'd expect an optimization error like that to get us stuck in the =
while loop, not exit from it prematurely.
>=20
> Yes, all true. I wonder though if the mutex lock/unlock counts as a =
reload point? These are usually some inline asm. If not one could =
possibly argue that the first chip->state access, before entering the =
while body is using an old value.

Yes, how inlines interact with sequence points has never been entirely =
clear to me. Especially since the compiler is free to inline something I =
didn't tell it to and to ignore me telling to inline if it wants to.

I *think* the rules are semantic. If it's written (preprocessor aside) =
to look like a function call then it counts as a sequence point even if =
it ends up being inlined. But that's all quite beyond anything I can say =
for sure!

>> Makes me head hurt!
>=20
> You are not alone :)

So collectively maybe we can make it hurt less. That's my theory, =
anyway, and I'm sticking to it.

-Mike
