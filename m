Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R9yXM-0001M7-Lt
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2011 12:19:25 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4] mtd: Add DiskOnChip G3 support
References: <1316633266-21312-1-git-send-email-robert.jarzmik@free.fr>
	<201109271539.21533.arnd@arndb.de> <878vp96fhl.fsf@free.fr>
	<201109281445.47715.arnd@arndb.de>
Date: Sat, 01 Oct 2011 14:19:08 +0200
In-Reply-To: <201109281445.47715.arnd@arndb.de> (Arnd Bergmann's message of
	"Wed, 28 Sep 2011 14:45:47 +0200")
Message-ID: <87y5x4hpkz.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arnd Bergmann <arnd@arndb.de> writes:

> I generally recommend removing debug messages like this entirely from
> production code. If you need them on production systems, that is an indication
> that the code quality is not good enough.
Perhaps.
But when you create a driver without any specification, and you release it to
the communauty, there will be unmet behaviours. So, when someone will ask me
"why in my board XXX my docg3 can't read data ?" how can I improve the driver
without any traces ?

> Enabling the debug output like
> this also creates a lot of almost identical strings, which you don't need
> if you turn it into an extern function that does
>
> 	static const char docseq[] = {
> 		[DOC_SEQ_RESET]		 = "reset",
> 		[DOC_SEQ_PAGE_SIZE_532]	 = "page_size_532",
> 	};
> 	dev_dbg(dev, "doc_flashSequence: %02x %s\n", docseq[seq]);
> with exactly the same output.
That doesn't look very good, as the sequence numbers are sparse numbers, and we
can finish with an array with values (0, 3, 8, 0xff) filled, and all the
remaining are null pointers (as these sequence numbers don't exist).


> Or you could turn the entire tracing into trace events and do the parsing
> in user space, which seems appropriate if you frequently need to trace
> these.
This looks much much better. I'll have a peek into that, as only (io_address,
read/write, width, value) could be dumped, and userland application could
translate it into sequence/nop/flashcontrol ... etc ...

-- 
Robert
