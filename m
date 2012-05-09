Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS7DB-00041N-7A
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 13:45:53 +0000
Received: by qcsu28 with SMTP id u28so225253qcs.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 06:45:46 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 May 2012 09:45:46 -0400
Message-ID: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
Subject: UBIFS error: replay_log_leb: first log node at LEB 3:0 is not CS node
From: James Nute <newten82@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I'm getting a UBIFS Corruption during a power failure with a fail
signature that I believe is different from what has been seen in the
past.
When I flash a new UBI image onto my device and boot it for the first
time everything comes up as expected. However if I force a power
failure before any major file writes occur the device will crash when
UBIFS attempts to recover during the next reboot. If I force a sync
command before the power failure I am able to successfully avert the
recovery failure. I worry that this indicates something ugly is going
on that I can't detect.

To get more debug messages I have enabled UBIFS debugging and enabled
the recovery and mount messages by booting with
""ubifs.debug_msgs=6144 ignore_loglevel" kernel parameters

Below is a snippet of the debug messages:

Mounting ubifs fileUBIFS DBG (pid 342): ubifs_bg_thread: background
thread "ubifs_bgt0_0" started, PID 342
system on 'ubi0:container'...
UBIFS: recovery needed
UBIFS error (pid 1): replay_log_leb: first log node at LEB 3:0 is not CS node
UBIFS error (pid 1): replay_log_leb: log error detected while
replaying the log at LEB 3:0
       magic          0x6101831
       crc            0x96c5716c
       node_type      8 (reference node)
       group_type     0 (no node group)
       sqnum          4544
       len            64
       lnum           138
       offs           67584
       jhead          1
UBIFS DBG (pid 342): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops
Error: can't mount 'ubi0:container'
Kernel panic - not syncing: Attempted to kill init!
Call Trace:
[c782be40] [c0008224] show_stack+0x4c/0x138 (unreliable)
[c782be80] [c0298040] panic+0xb4/0x1f8
[c782bee0] [c00208c8] do_exit+0x8c/0x648
[c782bf30] [c0020ec4] do_group_exit+0x0/0xdc
[c782bf40] [c000e148] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0x10000eac
   LR = 0x10000a50

A complete log can be viewed here: http://mcreech.com/work/ubifs-2012-05-08.txt

Does anyone have any suggestions?

Thanks,
James Nute
