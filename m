Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm16y-00065x-43
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 09:40:53 +0000
In-Reply-To: <76241A6C-ECA0-46B1-B8B4-F3786FCBA339@prograde.net>
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
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF77CEA9E9.F6F24A8C-ONC125782F.0033630B-C125782F.00352CE0@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sun, 6 Feb 2011 10:40:48 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
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

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/05 20:19:59:
> On Feb 5, 2011, at 5:29 AM, Joakim Tjernlund wrote:
>
> > Michael Cashwell <mboards@prograde.net> wrote on 2011/02/04 18:09:01:
> >>
> >> That's where I get confused. It's true that another thread could do that but wouldn't it have to bracket its operation with calls to get_chip() and put_chip()? Those actually do the suspend and resume. I'm certainly seeing erases being suspended to do a buffered write and then being resumed.
> >
> > buffered write do get_chip that suspends the erase, then a WAIT_TIMEOUT which drops the locks and gives the suspended erase a chance to wakeup and run but now SR is holding the status for the write so the suspended erase are testing the wrong status, do you agree?
>
> It's not that simple. Just waking the suspended erase thread should not cause it to "run" the way you are saying.
>
> That thread *should* wake up in inval_cache_and_wait_for_operation() inside its while (chip->state != chip_state) loop. The purpose of that loop is to see if something else is going on with the chip and if so just go back to sleep. That should prevent what you are saying is happening and if it is
not then we need to figure out why.

dropping the lock MIGTH make another thread waiting on that lock run if the scheduler decides so
or so I think anyway but I am no expert :)

>
> In the case of a buffered write the erase thread should see chip->state as either FL_WRITING_TO_BUFFER (if after the 0xE8) or FL_WRITING (if after the 0xD0). Since those don't match the expected FL_ERASING state the thread should stay in the while loop and go back to sleep on the wait queue. It
should keep doing that until the chip->state has come back to FL_ERASING. That should not happen until the write function is finished and does its put_chip and erase resume.
>
> So what I'm saying is that just dropping the locks and letting other threads run is not, by itself itself, wrong. The code's supposed to do that. It's just that the other threads are supposed check the conditions when they wake up and only proceed if the conditions are correct.

So we need to know if dropping the lock is guarantied not to schedule some other thread

>
> But I do see something suspicious. I think it can be argued that all CFI thread wake-ups need to do the while (chip->state != chip_state) dance and go back to sleep if not.

Makes sense.

>
> That seems to be the case for inval_cache_and_wait_for_operation() but what about the other places where threads can be scheduled out? Won't they just wake up where they are or am I missing some wait queue magic?
>
> IOW: We should look for other places outside of inval_cache_and_wait_for_operation() that call things like msleep, schedule, and cond_resched. (One sneaky one is cfi_udelay as it may call cond_resched.)
>
> If any of those fail to do the chip->state != chip_state sleep loop when they awaken then we have have found our problem.
>

[SNIP]

>
> > I won't worry about this until you test my patch and still have a problem :)
> > Please test it.
>
> I tested it quickly on Friday and it didn't fix my problem, but we may be fighting different problems.

Yes, I am getting the feeling that there are 2 different problems.

>
> I also can't be sure the .c file didn't have other changes. I was really pressed for time that day.
>
> My plan is to retest your patch against a pristine copy of the file and report back. Unfortunately this has to wait until Monday as I don't have access to the hardware over the weekend.
>
> -Mike
>
