Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Updlj-0004uJ-B9
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2013 12:15:16 +0000
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
 by tritech.se (8.14.3/8.14.3) with ESMTP id r5KCEeFo020537
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2013 14:14:45 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS: integck and tst_recovery
Date: Thu, 20 Jun 2013 12:14:40 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FC93588@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi,=0A=
=0A=
I want to use the integck program from mtd-utils for power-cut emulation=0A=
testing and I wonder how/if it is interrelated to to the debugfs=0A=
tst_recovery file.=0A=
=0A=
I tried running integck with -p for a long time but got no errors.=0A=
=0A=
I then enabled the tst_recovery (echo 1 > ....) and started the test=0A=
again. I immediately got a whole bunch of errors but as soon as the file=0A=
system was remounted the errors stopped. Checking tst_recovery I found=0A=
it was now disabled. Without stopping integck I then reenabled=0A=
tst_recovery and the same thing happened again.=0A=
=0A=
If anyone could shed some light on how this is supposed to be used, I=0A=
would be glad!=0A=
=0A=
I'm running the test on a separate "unused" UBIFS partition on a NOR=0A=
flash. The kernel version is 2.6.35 with all relevant UBIFS patches=0A=
from Linux stable.=0A=
=0A=
BR // Mats=
