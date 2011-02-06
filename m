Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm615-0000Rs-0a
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 14:55:07 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF77CEA9E9.F6F24A8C-ONC125782F.0033630B-C125782F.00352CE0@transmode.se>
Date: Sun, 6 Feb 2011 09:55:05 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1BD37BE-394D-4834-9833-973D7C4973C5@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
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
	<76241A6C-ECA0-46B1-B8B4-F3786FCBA339@prograde.net>
	<OF77CEA9E9.F6F24A8C-ONC125782F.0033630B-C125782F.00352CE0@transmode.se>
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

On Feb 6, 2011, at 4:40 AM, Joakim Tjernlund wrote:

> Michael Cashwell <mboards@prograde.net> wrote on 2011/02/05 20:19:59:
>>=20
>=20
>> It's not that simple. Just waking the suspended erase thread should =
not cause it to "run" the way you are saying.
>>=20
>> That thread *should* wake up in inval_cache_and_wait_for_operation() =
inside its while (chip->state !=3D chip_state) loop. The purpose of that =
loop is to see if something else is going on with the chip and if so =
just go back to sleep. That should prevent what you are saying is =
happening and if it is
> not then we need to figure out why.
>=20
> dropping the lock MIGTH make another thread waiting on that lock run =
if the scheduler decides so or so I think anyway but I am no expert :)

Nor am I! :-) And yes, that's completely true. But just running =
shouldn't do anything bad.

>> So what I'm saying is that just dropping the locks and letting other =
threads run is not, by itself itself, wrong. The code's supposed to do =
that. It's just that the other threads are supposed check the conditions =
when they wake up and only proceed if the conditions are correct.
>=20
> So we need to know if dropping the lock is guarantied not to schedule =
some other thread

I think we can know that at least in SMP systems. If you have multiple =
cores, just dropping the chip->lock would immediately allow other =
threads to get past taking that same lock. And even on single-processor =
systems if the thread in question is over its quantum it can get =
scheduled out. (There may be special rules for kernel threads.)

>> But I do see something suspicious. I think it can be argued that all =
CFI thread wake-ups need to do the while (chip->state !=3D chip_state) =
dance and go back to sleep if not.
>=20
> Makes sense.
>=20
>> That seems to be the case for inval_cache_and_wait_for_operation() =
but what about the other places where threads can be scheduled out? =
Won't they just wake up where they are or am I missing some wait queue =
magic?
>>=20
>> IOW: We should look for other places outside of =
inval_cache_and_wait_for_operation() that call things like msleep, =
schedule, and cond_resched. (One sneaky one is cfi_udelay as it may call =
cond_resched.)
>>=20
>> If any of those fail to do the chip->state !=3D chip_state sleep loop =
when they awaken then we have have found our problem.

And I do see places where at least cond_resched() is being called but =
are not then followed by the chip->state test. But I need to go through =
it more rigorously. (cfi_udelay() really worries me. It makes it look =
like udelay() that doesn't schedule but really calls cond_resched() if =
the delay is large enough. Risky to hide that, IMO.)

>>> I won't worry about this until you test my patch and still have a =
problem :)
>>> Please test it.
>>=20
>> I tested it quickly on Friday and it didn't fix my problem, but we =
may be fighting different problems.
>=20
> Yes, I am getting the feeling that there are 2 different problems.

Yes. So a proper test of your patch on Monday and more digging.  Fun!

-Mike
