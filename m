Received: from moutng.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYaWS-0000s6-Ag
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 11:53:17 +0000
Received: from [192.168.12.202] (port=20105 helo=mail.ammonit.com)
 by mail.ammonit.com with esmtps (TLSv1:AES128-SHA:128) (Exim 4.76)
 (envelope-from <sk@ammonit.com>) id 1VYaVv-0005C4-2R
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 13:52:43 +0200
Message-ID: <52666705.8040000@ammonit.com>
Date: Tue, 22 Oct 2013 13:52:37 +0200
From: =?ISO-8859-1?Q?Steffen_K=FChn?= <sk@ammonit.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: problem with ecc errors and ubifs
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

my question is about ecc errors and the way ubifs deals with it.
Unfortunately, I have to be a bit detailed to make my problem clear.

We use MT29F4G08ABBDAHC flash devices from Micron. This type of flash
supports on-die-ecc (8 bit) and needs at least 4-bit-ecc. When we have
started to use this flash no support for on die ecc was available in the
kernel (kernel 3.2). The on die ecc support is - because of that - self
written.

Everything works in principle very well. But we use our hardware in
greater numbers and quite intensively. Over the months we have observed
numerous destroyed file systems with different ubi errors. For finding
the reason of that problem I have written a mechanism to create bit
errors (in U-Boot).

With that I made different tests. One test was to create only one single
bit error in the whole flash device. The on die ecc mechanism (which can
correct up to 8 bit errors) had no problems to correct this error. The
kernel code has now a piece of code where the bit error occurrence is
reported to the stages above. With this information can ubifs decide if
and what it has to do.

I have seen that such error reporting leads usually to a page "scrub". I
do not really understand what there happens. But sometimes the result is
catastrophic. Because of that I have removed the error reporting (my
hope is that 8 bit errors occur seldom enough in a page) After that code
removing our problems are completely vanished (I have even tested with
more than 8 bit errors in the same page => no problems). I could not
provoke any faults by creating numerous bit errors in dozens of pages.

What is your opinion? Have I overlooked something? I know that this
method has risks but I hope that under the line the file system stays
longer alive.

Best
Steffen
