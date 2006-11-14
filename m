Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk7FV-0004dp-DK
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 17:59:32 -0500
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 2DB1D467E8
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 11:59:21 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 1C97546753
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 11:59:21 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0J8Q00201RKUUW00@sunstrike.tait.co.nz>
	(original mail from robin.gilks@tait.co.nz) for
	linux-mtd@lists.infradead.org;
	Wed, 15 Nov 2006 11:59:21 +1300 (NZDT)
Date: Wed, 15 Nov 2006 11:59:11 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
Subject: Re: Kernel oops in jffs2 mount - any ideas?
In-reply-to: <4559775D.8030009@transmode.se>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Message-id: <455A4A3F.4020304@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
References: <4553C6CB.2040207@tait.co.nz> <1163146170.3925.7.camel@sauron>
	<4557E56F.8070100@tait.co.nz> <1163411683.3925.31.camel@sauron>
	<4559412C.8080102@tait.co.nz> <4559775D.8030009@transmode.se>
Cc: MTD mail list <linux-mtd@lists.infradead.org>
Reply-To: robin.gilks@tait.co.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> Robin Gilks wrote:
>> Artem Bityutskiy wrote:
>>
>>   
>>> So the crash is somewhere in the CFI code. You should try to dig it and
>>> realize why it oopses.
>>>     
>> Pretty much at the same point except now its the garbage collector 
>> crashing and leaving a lock on an inode so the kernel stalls.
>>
>> No clues as to what is going on though :-(
>>
>>
>> HELP!
>>
>>   
> You should apply the bug fix I sent the other day(Re: cfi_cmd0001.c
> broken w.r.t Erase Suspend solved, patch included).
> This closes nasty bug that I think should be applied to linus tree ASAP.
> 
>  Jocke

The plot thickens - I'm now getting the following crash at boot about 
60% of the time (the other 40% is as previously reported) - still not 
had a single successful boot!!).

[   14.528955] Oops: kernel access of bad area, sig: 11 [#1]
[   14.539250] NIP: C00B3494 LR: C00B9684 CTR: 00000000
[   14.549111] REGS: c0327a70 TRAP: 0300   Not tainted  (2.6.18-buildroot)
[   14.562213] MSR: 00009032 <EE,ME,IR,DR>  CR: 22002022  XER: 2000005F
[   14.574838] DAR: FF8010EB, DSISR: C0000000
[   14.582968] TASK = c0324b40[1] 'swapper' THREAD: c0326000
[   14.593316] GPR00: C00BA60C C0327B20 C0324B40 FF800FFF 00000139 
D81A5184 C0230000 00000000
[   14.609904] GPR08: C01AD0F0 000002A0 84511AD8 DA2B0DD8 82002022 
00000000 03FF9000 C01C0000
[   14.626494] GPR16: C3C9FF50 00000000 00000000 00000000 C3CA4395 
0000000A 000F3FD0 0000000F
[   14.643082] GPR24: 000F0000 00010000 C5183FD0 00000139 C5180000 
00000139 C3C01C00 000F3FD0
[   14.660018] NIP [C00B3494] jffs2_get_ino_cache+0x0/0x4c
[   14.670388] LR [C00B9684] jffs2_scan_make_ino_cache+0x1c/0xa8
[   14.681787] Call Trace:
[   14.686639] [C0327B20] [00010000] 0x10000 (unreliable)
[   14.696835] [C0327B40] [C00BA60C] jffs2_scan_medium+0xefc/0xfe4
[   14.708587] [C0327BC0] [C00BCA7C] jffs2_do_mount_fs+0x180/0x8ec
[   14.720337] [C0327BF0] [C00BEF0C] jffs2_do_fill_super+0xbc/0x244
[   14.732260] [C0327C10] [C00BF718] jffs2_get_sb_mtd+0xfc/0x19c
[   14.743665] [C0327C50] [C00BF9C4] jffs2_get_sb+0x180/0x228
[   14.754551] [C0327CE0] [C005A42C] vfs_kern_mount+0x5c/0xbc
[   14.765438] [C0327D00] [C005A4C8] do_kern_mount+0x3c/0x60
[   14.776151] [C0327D30] [C0072374] do_mount+0x394/0x680
[   14.786346] [C0327EB0] [C00729F8] sys_mount+0x98/0xe8
[   14.796369] [C0327EF0] [C021E864] do_mount_root+0x2c/0xc4
[   14.807082] [C0327F10] [C021E9C0] mount_block_root+0xc4/0x248
[   14.818487] [C0327F60] [C021EE3C] prepare_namespace+0xb8/0x190
[   14.830065] [C0327F80] [C0002494] init+0x254/0x2e4
[   14.839568] [C0327FF0] [C000514C] kernel_thread+0x44/0x60
[   14.850268] Instruction dump:
[   14.856145] 9421fff0 386300e4 38c00000 90010014 b0a4000a 38800003 
38a00001 4bf5b661
[   14.871523] 80010014 38210010 7c0803a6 4e800020 <816300ec> 548915fa 
7c69582e 2f030000
[   14.888894] Kernel panic - not syncing: Attempted to kill init!
[   14.900725]  <0>Rebooting in 1 seconds..



=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
