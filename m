Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkDjF-0001gl-00
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 23:13:14 -0400
Received: from eric by maxwell.lnxi.com with local (Exim 3.35 #1 (Debian))
	id 1BkDjE-0000KS-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jul 2004 21:13:12 -0600
To: <linux-mtd@lists.infradead.org> 
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 12 Jul 2004 21:13:11 -0600
Message-ID: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Subject: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Currently for NOR flash we have two general purpose probe
routines that cover almost every case: cfi_probe and jedec_probe.

cfi_probe was written first and it assumes that every command set
has a unique number.  For CFI chips that appears to hold true
as the command set identifier is part of the interface.  However
for devices detected by jedec_probe that is not quite true.

While all of the devices have command sets quite similar to those
supported by cfi_probe frequently there in not a one to one mapping of
functionality.  The biggest differences are that many AMD command set
chips detected by jedec_probe do not support all of cfi_cmdset_0002,
and that several of the firmware hub based devices have weird offset
unlock registers, that cfi_cmdset_0001 does not support.

As more features are implemented and the mtd drivers are becoming
more widely used these semantic mismatches are beginning to cause
maintenance problems.  Calling certain methods on chips
that do not support them could be quite error prone.

To remedy this I would like to have the probe functions fill in
not the CmdSet number but a structure full of function pointers.
And of course the upper layers need to be modified to cope.

Doing this refactoring will be a little bit painful but I don't see
any other way to keep the code base maintainable as our number
of supported chips grows.

I have both Intel and AMD chips to test against.  CFI and non CFI
all being used as motherboard BIOS chips.  So I should be able
to catch the vast majority of problems in testing.  All but the
delicate chip interleave case, but I should not actually be touching
that part of the code, and at least I am aware of the issue.

Does anyone have any problems with this refactoring?

Eric
