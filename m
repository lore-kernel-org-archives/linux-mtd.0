Received: from wproxy.gmail.com ([64.233.184.199])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cuhid-0007z1-Mf
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2005 20:48:12 -0500
Received: by wproxy.gmail.com with SMTP id 68so459620wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Jan 2005 17:48:10 -0800 (PST)
Message-ID: <6934efce050128174863077433@mail.gmail.com>
Date: Fri, 28 Jan 2005 17:48:10 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.61.0501281508160.21048@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <6934efce05012717207271fb10@mail.gmail.com>
	<m33bwmw0ax.fsf@maxwell.lnxi.com>
	<6934efce050128114749c662b1@mail.gmail.com>
	<Pine.LNX.4.61.0501281508160.21048@localhost.localdomain>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	"Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: Unit test for cfi_cmdset_0001.c
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I can see that.  But in this particular case I think it would be better
> for code maintainability, and more importantly upstream code acceptance,
> that the code remains as is and that you write a small perl script to
> split it up automatically.

Right, #1 it is then.  For now that is, until ya'll see how niffty the
test tools are.

>  The test tools could be committed to the MTD
> CVS but they would never see the mainline tree.

I couldn't, wouldn't, shouldn't ask for more.

> That's why I'm not sold to the idea since that particular driver sees
> its core complexity in the locking, scheduling and concurrent stomping
> on the state machine.  I don't think synthetic tests can replace careful
> inspection and perfect understanding of the code.  Static analysis tools
> like sparse should help with locking correctness though.  But I'm always
> open to be shown otherwise!

I think you'll be surprised how much of that locking and concurrency
we can test.

> For filesystems I can imagine.  It has many more conditions to deal with
> and making sure all of them are tested can be tedious.  But
> purely writing to
> flash is not that complex (or is it?) compared to all the needed code
> above that dealing with concurrency.
> 
> I remember the first Linux NOR flash driver I wrote in 1997: pure char
> device, no MTD layer, no reentrancy, no scheduling, just the pure flash
> read/write.  It was in the order of 20 to 30 lines of code.  I made it a
> block device with about 20 additional lines.  It even was able to deal
> with flash errors!  More than that like what we have today is
> performance stuff.

Anything paragraph about coding that starts with 'I remember' is pure gold!

I don't know.  The drivers are not that simple.  Lots of obscure cases
and states.  I can say this much, almost every bug I've seen would be
have been found by a unit test.  Of course this is almost as much
because of the process of creating the tests as actually running them.
 Running the tests will make sure you don't reintroduce bugs you found
before as the code evolves.
