Received: from mdfmta010.mxout.tch.inty.net ([91.221.169.51]
 helo=smtp.demon.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xcaat-0002Ev-L6
 for linux-mtd@lists.infradead.org; Fri, 10 Oct 2014 13:51:01 +0000
Received: from mdfmta010.tch.inty.net (unknown [127.0.0.1])
 by mdfmta010.tch.inty.net (Postfix) with ESMTP id AFA3040132D
 for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2014 14:50:24 +0100 (BST)
Received: from mdfmta010.tch.inty.net (unknown [127.0.0.1])
 by mdfmta010.tch.inty.net (Postfix) with ESMTP id 4D2D640131E
 for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2014 14:50:24 +0100 (BST)
Received: from [192.168.0.200] (unknown [80.176.156.169])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mdfmta010.tch.inty.net (Postfix) with ESMTP
 for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2014 14:50:24 +0100 (BST)
Date: Fri, 10 Oct 2014 14:45:50 +0100 (BST)
From: Steve B <steve@baconbits.demon.co.uk>
To: linux-mtd@lists.infradead.org
Subject: UBI/UBFS: ubi_eba_read_leb() reporting unmapped LEB
Message-ID: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I've been running a reboot test on 5 devices and after about 7000 reboot files in
one of our UBIFS volumes reports a corruption (SQUASHFS errors). I have been
able to extract the mtd partition and pull it into a nandsim instance on my host
machine so I can add some extra debug. Here's the error log when trying to load
the file:

[41308.683356] UBI DBG gen (pid 15044): read 4062 bytes from LEB 1:352:0
[41308.683358] UBI DBG eba (pid 15044): read 4062 bytes from offset 0 of LEB 1:352 (unmapped)
[41308.683362] UBI DBG gen (pid 15044): read 4062 bytes from LEB 1:352:0
[41308.683364] UBI DBG eba (pid 15044): read 4062 bytes from offset 0 of LEB 1:352 (unmapped)
[41308.683368] UBIFS error (pid 15044): ubifs_read_node: bad node type (255 but expected 1)
[41308.683373] UBI DBG gen (pid 15044): test LEB 1:352
[41308.683377] UBIFS error (pid 15044): ubifs_read_node: bad node at LEB 352:0, LEB mapping status 0
[41308.683381] Not a node, first 24 bytes:
[41308.683386] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
[41308.683392] Pid: 15044, comm: md5sum Tainted: GF          O 3.8.0-29-generic #42~precise1-Ubuntu
[41308.683396] Call Trace:
[41308.683411]  [<ffffffffa0564a7d>] ubifs_read_node+0x26d/0x2d0 [ubifs]
[41308.683419]  [<ffffffffa0583338>] ubifs_tnc_read_node+0x148/0x160 [ubifs]
[41308.683426]  [<ffffffffa056816c>] ubifs_tnc_locate+0x1cc/0x1f0 [ubifs]
[41308.683431]  [<ffffffffa0559ade>] do_readpage+0x10e/0x410 [ubifs]
[41308.683437]  [<ffffffffa055a4ce>] ubifs_readpage+0x5e/0x580 [ubifs]
[41308.683441]  [<ffffffff81152de3>] ? __inc_zone_page_state+0x33/0x40
[41308.683444]  [<ffffffff81135866>] ? add_to_page_cache_locked.part.26+0x76/0xd0
[41308.683447]  [<ffffffff8113593d>] ? add_to_page_cache_locked+0x7d/0x90
[41308.683452]  [<ffffffff81135edd>] do_generic_file_read.constprop.31+0x10d/0x440
[41308.683460]  [<ffffffff81136f01>] generic_file_aio_read+0xe1/0x220
[41308.683469]  [<ffffffff8119b0c3>] do_sync_read+0xa3/0xe0
[41308.683477]  [<ffffffff8119b800>] vfs_read+0xb0/0x180
[41308.683485]  [<ffffffff8119b922>] sys_read+0x52/0xa0
[41308.683492]  [<ffffffff816fc8dd>] system_call_fastpath+0x1a/0x1f

I have written a small tool to scan the headers in all PEBs and this confirms
that LEB 352 doesn't exist for this volume.

We are running a Linux kernel based off 3.4.0

This issue seems similar to an issue already raised on this mailing list:
linux-mtd/2010-September/031837.html
subject: ubi_eba_init_scan: cannot reserve enough PEBs

I would like to know the best way to debug this issue, does anyone have the patch
mentioned in the issue above to add more debugging in the right places?

Our test setup has the facility of pulling the power on the unit if a GPIO line
is toggled, with this we can test sensitive areas of the code, can anyone suggest
where would be a good place to perform this action.

Thanks for any help on this,
Steve B
