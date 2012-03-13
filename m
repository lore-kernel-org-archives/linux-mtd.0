Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7L6A-0007Nq-KS
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 06:20:43 +0000
Received: by yhjj52 with SMTP id j52so202047yhj.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Mar 2012 23:20:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
Date: Tue, 13 Mar 2012 07:20:39 +0100
Message-ID: <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Matej Kupljen <matej.kupljen@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear, Artem,

>> Do you see any issues if you have no power cuts, or these things only
>> happen as a result of power cuts?
>
> I'll try to reproduce the problem, by doing clean reboots and will get
> back to you.

I tried to do a clean reboots, and today, when I turned on the device,
the UBIFS was mounted O.K., but then during init, I got the following error:

===========================================================================
[   26.164000] UBIFS error (pid 965): ubifs_read_node: bad node type
(255 but expected 0)
[   26.168000] UBIFS error (pid 965): ubifs_read_node: bad node at LEB
149:4416, LEB mapping status 1
[   26.176000] [<c002ba14>] (unwind_backtrace+0x0/0xe0) from
[<c0112d3c>] (ubifs_read_node+0x240/0x274)
[   26.180000] [<c0112d3c>] (ubifs_read_node+0x240/0x274) from
[<c012d94c>] (ubifs_tnc_read_node+0x50/0xe0)
[   26.184000] [<c012d94c>] (ubifs_tnc_read_node+0x50/0xe0) from
[<c0117130>] (ubifs_tnc_locate+0x134/0x17c)
[   26.188000] [<c0117130>] (ubifs_tnc_locate+0x134/0x17c) from
[<c010d950>] (ubifs_iget+0x6c/0x7b0)
[   26.192000] [<c010d950>] (ubifs_iget+0x6c/0x7b0) from [<c010c988>]
(ubifs_lookup+0x130/0x1d4)
[   26.196000] [<c010c988>] (ubifs_lookup+0x130/0x1d4) from
[<c0090898>] (__lookup_hash+0x110/0x130)
[   26.204000] [<c0090898>] (__lookup_hash+0x110/0x130) from
[<c00936b4>] (do_filp_open+0x200/0x8e4)
[   26.208000] [<c00936b4>] (do_filp_open+0x200/0x8e4) from
[<c008728c>] (do_sys_open+0x5c/0x114)
[   26.212000] [<c008728c>] (do_sys_open+0x5c/0x114) from [<c0025e20>]
(ret_fast_syscall+0x0/0x28)
[   26.216000] UBIFS error (pid 965): ubifs_iget: failed to read inode
1841, error -22
[   26.220000] UBIFS error (pid 965): ubifs_lookup: dead directory
entry 'updated.log', error -22
===========================================================================

However, I can still login and do a reboot, and when the board is
rebooted, I noticed this
in the boot log:

===========================================================================
[    0.836000] UBI error: check_corruption: PEB 160 contains corrupted
VID header, and the data does not contain all 0xFF, thin
[    1.216000] UBI error: check_what_we_have: 1 PEBs are corrupted and preserved
[    1.220000] Corrupted PEBs are: 160
[    1.224000] UBI: max. sequence number:       41
[    1.248000] UBI warning: print_rsvd_warning: cannot reserve enough
PEBs for bad PEB handling, reserved 7, need 8
[    1.252000] UBI warning: print_rsvd_warning: 1 PEBs are corrupted
and not used
===========================================================================

If I login the FS is mounted as RO. If I remount it in RW and try to
do a sync, I get:

===========================================================================
# sync
[  193.176000] UBIFS error (pid 369): make_reservation: cannot reserve
160 bytes in jhead 1, error -30
[  193.180000] UBIFS error (pid 369): ubifs_write_inode: can't write
inode 1855, error -30
[  193.196000] UBIFS error (pid 2886): do_commit: commit failed, error -30
===========================================================================

What could be the cause of such many errors in FS?
I am really running out of ideas, how to solve this, so any hint would
be appreciated.

Thank you and Best Regards,
Matej
