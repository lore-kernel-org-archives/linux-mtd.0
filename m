Received: from modemcable096.213-200-24.mc.videotron.ca ([24.200.213.96]
	helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CudD3-0006Lu-0W
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2005 15:59:20 -0500
Date: Fri, 28 Jan 2005 15:59:08 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050128114749c662b1@mail.gmail.com>
Message-ID: <Pine.LNX.4.61.0501281508160.21048@localhost.localdomain>
References: <6934efce05012717207271fb10@mail.gmail.com>
	<m33bwmw0ax.fsf@maxwell.lnxi.com>
	<6934efce050128114749c662b1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD List <linux-mtd@lists.infradead.org>,
	"Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: Unit test for cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 28 Jan 2005, Jared Hulbert wrote:

> Consider cfi_cmdset_0001.c: 
> cfi_intelext_write_buffers() calls cfi_intelext_write_words() and
> do_write_buffer()
> 
> In order to properly unit test you'd need to stub out
> cfi_intelext_write_words() and do_write_buffer().  For those that
> don't understand stubbing out this means creating a phony functions to
> accept input and give output based on the test condition.  This allows
> you to test code paths that are improbable under nomial conditions or
> very difficult to test with other methods.  But if the
> do_write_buffer() is compiled into the same .o as
> cfi_intelext_write_buffers() I'm not sure how to link to my stub
> do_write_buffer() instead of the real one.  That is the problem that
> drives my original question about #if's, forking the files, etc.

I can see that.  But in this particular case I think it would be better 
for code maintainability, and more importantly upstream code acceptance, 
that the code remains as is and that you write a small perl script to 
split it up automatically.  The test tools could be committed to the MTD 
CVS but they would never see the mainline tree.

> Because there are macros between this driver and any real hardware it
> should be rather easy to test various states and see at least the
> sequence of events the hardware will see.  This allow you to test for
> hardware that does not exist or is not really worth it.  Certianly it
> is not a magic bullet, it is only as good as your tests, and doesn't
> find timing bugs or bugs related to multitasking etc.

That's why I'm not sold to the idea since that particular driver sees 
its core complexity in the locking, scheduling and concurrent stomping 
on the state machine.  I don't think synthetic tests can replace careful 
inspection and perfect understanding of the code.  Static analysis tools 
like sparse should help with locking correctness though.  But I'm always 
open to be shown otherwise!

> I did it with a file system at work it was very useful.

For filesystems I can imagine.  It has many more conditions to deal with 
and making sure all of them are tested can be tedious.  But 
purely writing to 
flash is not that complex (or is it?) compared to all the needed code 
above that dealing with concurrency.

I remember the first Linux NOR flash driver I wrote in 1997: pure char 
device, no MTD layer, no reentrancy, no scheduling, just the pure flash 
read/write.  It was in the order of 20 to 30 lines of code.  I made it a 
block device with about 20 additional lines.  It even was able to deal 
with flash errors!  More than that like what we have today is 
performance stuff.


Nicolas
