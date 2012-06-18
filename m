Received: from mail-de.keymile.com ([195.8.104.1])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgWKg-0002jJ-3E
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 07:25:08 +0000
From: Gerlando Falauto <gerlando.falauto@keymile.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 0/2] Micron (formerly Numonyx) M29EW NOR flash issues
Date: Mon, 18 Jun 2012 09:24:37 +0200
Message-Id: <1340004279-26496-1-git-send-email-gerlando.falauto@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Holger Brunck <holger.brunck@keymile.com>, Leo <leo.costa77@gmail.com>,
 Stefan Bigler <stefan.bigler@keymile.com>,
 Gerlando Falauto <gerlando.falauto@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

we have been experiencing some problems with the above NOR flash.
Please find our analysis and the patches we applied to 3.0.8.
Patches of course are not meant for mainlining "as is"; we'd rather appreciate
your suggestions as to how to make them suitable for inclusion.
It should be a fairly common flash part, but it sounds like noone has run into
this issue so far except
http://lists.infradead.org/pipermail/linux-mtd/2011-April/034867.html

Thank you very much,
Gerlando Falauto

PROBLEM ANALYSIS:

This issue only appears when performing concurrent operations like simultaneous
UBI volume creation/deletion, but rarerly under normal conditions.
The problem seems to happen rather soon though when the unit is put in a
Climate Chamber at high temperatures (say 60°C).

In our experience the most probable root cause is the delay needed after an
erase resume, before a new erase suspend can be issued again [PATCH 2/2].

This is documented on page 22 of the technical note TN-13-07 from Micron:
http://www.micron.com/~/media/Documents/Products/Technical%20Note/NOR%20Flash/tn1307_patching_linux_kernel_for_m29.ashx

[NOTE: TN-13-07 explicitly refers to "some revisions of the M29EW (for example,
A1 and A2 step revisions)", even though our boards are equipped with silicon
revision 12 = 0xC]

Adding this delay with a value of 500 us seems to fix the problem even at high
temperatures. This is also incidentally the typical value for the "Erase to
suspend" parameter as specified the datasheet:
Erase to suspend is the typical time between an initial BLOCK ERASE or
ERASE RESUME command and a subsequent ERASE SUSPEND command. Violating the
specification repeatedly during any particular block erase may cause erase
failures.

Also, [PATCH 1/2] described on page 20 (Correcting Erase Suspend Hang Ups,
was added first, although it does not appear to have any impact on the issue.

SIDE NOTE:

The flash stressing test used to reproduce this issue has shown in some cases
the unforeseen side effect of inexplicably damaging sector 0 (which is where
u-boot code resides). When this happened, sector 0 could not be erased anymore,
not even through JTAG. A couple of times, further attempts at reprogramming the
sector mysteriously lead it to be erasable again.
One particular board however (incidentally brought into that condition after a
test in the climate chamber) showed unstable values for some bits of sector 0
among successive reads. All other sectors seemed to be immune to this problem.
For this board I could not find any way to erase sector 0.
This is currently an open issue with wrong software operations causing hardware
to break.

Signed-off-by: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Stefan Bigler <stefan.bigler@keymile.com>
Cc: Holger Brunck <holger.brunck@keymile.com>
Cc: Leo <leo.costa77@gmail.com>

Gerlando Falauto (2):
  mtd: cfi_cmdset_0002: Micron M29EW bugfix "Correcting Erase Suspend
    Hang Ups"
  mtd: cfi_cmdset_0002: Micron M29EW bugfix "Resolving the Delay After
    Resume Issue"

 drivers/mtd/chips/cfi_cmdset_0002.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
