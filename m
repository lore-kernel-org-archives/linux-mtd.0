Received: from mailgw1.ericsson.se ([193.180.251.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSkRg-0007us-Gn
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 07:40:05 +0000
From: Christian Melki <christian.melki@ericsson.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 11 May 2012 09:39:12 +0200
Subject: Back to back mtdchar reads causing massive kernel latencies?
Message-ID: <1346E68D3A5B2043907CF4BF466383411A081905A2@ESESSCMS0353.eemea.ericsson.se>
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

Hi.

I have a powerpc 8347 attached to a nor-flash.
On the device sits a hardware watchdog with non changeable
watchdog timeout at minimum 1600ms (likely almost 3 seconds,
depending on external temperature).
The kernel has timers to kick the watchdog once every second.
This has never been a problem, not even at 100% userspace load.
But when I do back to back reads using mtdchar with eraseblock
sizes, the watchdog times out.
This does not happen in any other situation and I can reliably
reproduce it with dd to any of my mtdchar devices.
Also, it does not happen if I use mtdblock instead which seem to
have a schedule()inside it's worker loop.
But I can't figure out why this would ever happen to the
mtdchar device?
Switching between userland and kernelspace with the data would
cause a scheduling point for the kernel anyway, right?
Is someone packing the back-to-back reads into something very
large that does not return in time?
Strace tells me that the reads are still 128k large.
A timed normal read on 128k eraseblock takes approx. 70ms.

I can see that the cmdset for the flash has schedule points at
erase and some other xip stuff, but not in the read path.
I have tried HZ at 100 and 1000, with and without preemption and
with and without NO_HZ. Same result.

Clues as to what's happening anyone?

Regards,
Christian
