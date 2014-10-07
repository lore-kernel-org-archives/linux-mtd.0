Received: from mail-yh0-f47.google.com ([209.85.213.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbVna-0005Yf-1P
 for linux-mtd@lists.infradead.org; Tue, 07 Oct 2014 14:31:37 +0000
Received: by mail-yh0-f47.google.com with SMTP id c41so3009663yho.20
 for <linux-mtd@lists.infradead.org>; Tue, 07 Oct 2014 07:31:12 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 7 Oct 2014 15:31:11 +0100
Message-ID: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
Subject: UBI_READWRITE constraint when opening volumes to rename
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: ezequiel.garcia@free-electrons.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'd like to be able to safely rename a UBI volume that contains a
mounted UBIFS volume.

This allows for firmware upgrade via the following steps:

- ubimkvol rootfs_new
- ubiupdatevol rootfs_new
- ubirename rootfs rootfs_old rootfs_new rootfs
- reboot
- ubirmvol rootfs_old

Such an approach makes upgrade of a root filesystem simple as there is
no need to unmount the root filesystem. I believe this question has
been asked before on this mailing list
(http://lists.infradead.org/pipermail/linux-mtd/2012-February/039743.html).

This process isn't possible at the moment as 'rename_volumes' opens
the UBI volume with UBI_READWRITE. Unfortunately UBIFS always opens
UBI with UBI_READWRITE regardless to if the user mounts as read-only.
If 'rename_volumes' is changed to UBI_READONLY then the above process
works.

I understand that this patch
https://patchwork.ozlabs.org/patch/339711/ recently changed the first
open restraint in 'rename_volumes' from UBI_EXCLUSIVE to
UBI_READWRITE. I'd like to understand if there are any risks in
changing it to UBI_READONLY?

Thanks,

Andrew Murray
