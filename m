Received: from webmanixhosting.com ([216.40.225.16]
	helo=www.webmanixhosting.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkQJY-00055X-Up
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 12:39:33 -0400
From: "Dan Post" <djp.mtd@onemyth.net>
To: ebiederman@lnxi.com (Eric W. Biederman)
Date: Tue, 13 Jul 2004 08:36:22 -0800
Message-Id: <20040713163622.M68171@onemyth.net>
In-Reply-To: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 Jul 2004 21:13:11 -0600, Eric W. Biederman wrote
> I have both Intel and AMD chips to test against.  CFI and non CFI
> all being used as motherboard BIOS chips.  So I should be able
> to catch the vast majority of problems in testing.  All but the
> delicate chip interleave case, but I should not actually be touching
> that part of the code, and at least I am aware of the issue.

Eric, I have been working on updating cfi_cmdset_0001.c / cfi_probe to support
Intel(R) L18/30 parts.  My work hasn't been rolled up into the MTD yet,
primarily because I haven't been very agile--been really busy with other
things, but this is going to get better.

Changes to cfi_probe are minimal; L18 has the same cmdset.  The CFI version is
1.3, but this is handled by the cfi_cmdset_0001.c driver.  The only changes to
cfi_probe were read mode -> 0xFF since L18 doesn't seem to understand 0xF0 (it
broke XIP until I fixed it, but K3 worked fine with 0xF0).

I don't know how deep you plan on getting into the driver, but there are some
things to take into consideration when you refactor...  L18 has multiple
hardware "partitions"--you can read one section and be writing the other
section at the same time, essentially.  i.e. for a 32MiB chip you have 16
state machines, each for 2MiB of the chip.  There are a couple of rules.  You
can only be programming or erasing in one partition at a time, but you can
suspend an erase, program, suspend the program, resume program, resume erase
(or any subset thereof).  And there is an extended OTP space.  Those are the
biggest changes to keep in mind.

So I would appreciate it if you try not to really break the state machine.  I
will need to extend the state machine code if anything.  So please don't rip
it out / simplify it too much.  This will make my later work easier.  I saw
that Nico started to do some of this L18 work but rolled it back.

BTW, older flash parts, e.g. K3, J3, et al, are handled by the same driver, by
faking a single hwpart to cover the entire part.

What Intel(R) flash parts are you working with?  L18 support exists and I can
point you to some code, but it hasn't been rolled up into CVS yet.  Probably
because it targets a now-out-of-date version [thanks to all the activity
lately] and the changes are quite extensive...

Coincidentally, I work at Intel(R) Corporation.  If things get sticky with the
NOR flash support refactoring, give me a shout.

> Does anyone have any problems with this refactoring?

Sounds like a great idea.

Dan
