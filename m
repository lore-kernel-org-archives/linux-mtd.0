Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ykoss-0004Ih-U7
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 07:15:47 +0000
Received: by iebrs15 with SMTP id rs15so31092998ieb.3
 for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2015 00:15:25 -0700 (PDT)
MIME-Version: 1.0
From: Juha Kuikka <juha.kuikka@gmail.com>
Date: Wed, 22 Apr 2015 00:15:04 -0700
Message-ID: <CAKvrXUo5Tj8E3W-fO2cgm1BcaJVE1kYzHAa4S1mopU6rC+10NQ@mail.gmail.com>
Subject: UBI/UBIFS: mount fails after volume truncate
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I ran into a weird thing today and I am not sure if this is expected
behavior in my use case or an error:

1. Truncate volume (UBI_IOCVOLUP with zero size)
2. Reboot system few seconds after
3. After reboot try to mount the truncated volume

Mount will fail with UBIFS complaining it cannot find a node in LEB
zero (expected 6, got 255 for id). the message also indicates that the
LEB is mapped.

Further, the error message in dmesg shows the first 32 bytes of the
LEB, they show 0xFF.

I find this strange, I would think the block either:
A. Still has original EC, VID and data
B. Had been erased (no EC, VID, data), in which case it wouldn't be
mapped as LEB at all

Or I suppose this could be an issue with fastmap if the mapping was
read from FM but block was actually erased...

This is on older kernel (3.8.13), so it could be an already fixed
fastmap issue I suppose. I could go for a backport.

Q1: How "atomic" is volume truncate? Are the unmapped lebs erase
immediately or later?
Q2: Any foreseen big issues in backporting UBI & UBIFS updates to 3.8.13?

Cheers,
 - Juha
