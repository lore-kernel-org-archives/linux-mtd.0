Received: from mail-dm3nam03on0094.outbound.protection.outlook.com
 ([104.47.41.94] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drX4M-0005vg-KC
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 22:20:45 +0000
From: Brian Niebuhr <BNiebuhr@efji.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: do_write_buffer() unexpected timeout
Date: Mon, 11 Sep 2017 22:20:08 +0000
Message-ID: <2588C357BB271A4CA8E86BCFF043FA92339B949D@EFJDFWMB01.EFJDFW.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All -

I am using a 16-bit S29GL-S flash on a 3.3 kernel and I am experiencing an =
occasional "software timeout" in do_write_buffer() in cfi_cmdset_0002.c.   =
 I am aware of the do_write_buffer() timeout patch that was made later on a=
nd I have applied it to my kernel, but that patch doesn't solve my problem =
because the amount of time that is elapsing is much longer than the flash p=
rogramming time.   I have verified that the amount of time that elapses is =
indeed longer than the timeout, usually about 11-15 ms, which is also signi=
ficantly longer than the buffered program operation on this flash part.  I =
verified that the kernel is not spending a huge amount of time in the polli=
ng loop - the loop runs about 20 times during that 11-15 ms.  So what I bel=
ieve is happening is that since the CPU is pretty busy at that point, some =
other threads are running while the flash part is programming, and when the=
 thread running do_write_buffer() executes again the timeout has expired.

What I would expect to happen at that point would be that the time_after() =
check would indicate timeout, but chip_ready() would be true so the operati=
on will complete.  Instead I find that chip_ready() is false and I get the =
timeout error instead.   At that point I wanted to know why chip_ready() wa=
s false, so after the time_after() call indicates that the time limit has b=
een exceeded, I added code to read the flash data poll value three times an=
d print it out.  In cases where the time limit has been exceeded, most of t=
he time the those three reads yield the same value, which is equivalent to =
the last word programmed (as expected).  However every once in a while the =
three reads of the data poll value come out as follows:

A B B

Where 'B' is the value of the last word written to the programming buffer, =
as in the normal case.  The value of 'A' is different though, and the value=
 of 'A' is as follows (in binary):

yyyyyyyyyyyZyZyy

Where the 'y' bits are the same as the last value written to the programmin=
g buffer ('B'), but one or both of the bits marked 'Z' will be 'zero' inste=
ad of being 'one' bits as they are in 'B'.  In my understanding, these two =
bits are DQ4 and DQ2 according to the flash specification.  I can't underst=
and why the first read of the data poll value would have DQ4 and/or DQ2 set=
 to zero while DQ7 is valid and DQ6 isn't toggling.  Subsequent reads at th=
at address continue to yield the value 'B', so it's just the first read tha=
t's wrong.

Can anyone explain what might be going on here?  I'm not sure why my flash =
part is behaving this way, and how to fix it.

Thanks,

Brian


This e-mail transmission, and any documents, files or previous e-mail messa=
ges attached to it, may contain confidential information. If you are not th=
e intended recipient, or a person responsible for delivering it to the inte=
nded recipient, you are hereby notified that any disclosure, distribution, =
review, copy or use of any of the information contained in or attached to t=
his message is STRICTLY PROHIBITED. If you have received this transmission =
in error, please immediately notify us by reply e-mail, and destroy the ori=
ginal transmission and its attachments without reading them or saving them =
to disk. Thank you.
