Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cuc5d-0005nN-35
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2005 14:47:34 -0500
Received: by wproxy.gmail.com with SMTP id 68so430544wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Jan 2005 11:47:31 -0800 (PST)
Message-ID: <6934efce050128114749c662b1@mail.gmail.com>
Date: Fri, 28 Jan 2005 11:47:31 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m33bwmw0ax.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <6934efce05012717207271fb10@mail.gmail.com>
	<m33bwmw0ax.fsf@maxwell.lnxi.com>
Cc: MTD List <linux-mtd@lists.infradead.org>
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

Wow!  Lots of sceptics!   Help!  Anybody who thinks this is an idea
that is promising please chime in. :)

Hmm, Let me try to explain a little better.

Consider cfi_cmdset_0001.c: 
cfi_intelext_write_buffers() calls cfi_intelext_write_words() and
do_write_buffer()

In order to properly unit test you'd need to stub out
cfi_intelext_write_words() and do_write_buffer().  For those that
don't understand stubbing out this means creating a phony functions to
accept input and give output based on the test condition.  This allows
you to test code paths that are improbable under nomial conditions or
very difficult to test with other methods.  But if the
do_write_buffer() is compiled into the same .o as
cfi_intelext_write_buffers() I'm not sure how to link to my stub
do_write_buffer() instead of the real one.  That is the problem that
drives my original question about #if's, forking the files, etc.

Because there are macros between this driver and any real hardware it
should be rather easy to test various states and see at least the
sequence of events the hardware will see.  This allow you to test for
hardware that does not exist or is not really worth it.  Certianly it
is not a magic bullet, it is only as good as your tests, and doesn't
find timing bugs or bugs related to multitasking etc.

I did it with a file system at work it was very useful.

,JAred
