Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erQsA-00054t-H5
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 16:16:00 +0000
Received: by mail-wm0-x22d.google.com with SMTP id z9so13153820wmb.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2018 08:15:47 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 1 Mar 2018 08:15:44 -0800
Message-ID: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
Subject: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Scott Bowman <wbowma01@harris.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

I have a user with an IMX6 and raw NAND using UBI/UBIFS who has been
able to reproduce a NAND corruption:

[   10.611972] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 631
[   10.634365] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
[   10.657492] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
[   10.681137] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
[   10.704267] ubi0 error: ubi_io_read: error -74 (ECC error) while
reading 253952 bytes from PEB 2807:8192, read 253952 bytes

The kernel they are using is a bit out of date but does have
'gpmi-nand: Handle ECC Errors in erased pages' [1] patch

I'm wondering if the 'unstable bits issue' [2] is still an issue or if
the UBI/UBFS Documentation is out of date and this has been resolved.
If it has been resolved, can anyone point me to the patches.

Regards,

Tim

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bd2e778c9ee361c23ccb2b10591712e129d97893
[2] http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits
