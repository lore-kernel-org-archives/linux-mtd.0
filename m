Received: from mail-it1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi2SV-00053C-EH
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 19:27:12 +0000
Received: by mail-it1-x131.google.com with SMTP id h65so4375530ith.3
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2019 11:27:10 -0800 (PST)
MIME-Version: 1.0
From: Zachary Graham <zack.graham@gmail.com>
Date: Fri, 11 Jan 2019 11:27:17 -0800
Message-ID: <CAMawHmDZj-Ht4PKtB72B8fPOSiPVefAwt=hkaiu8bhyOeUAG8A@mail.gmail.com>
Subject: Bad block detection question
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm working with a Linux system that, for the most part, uses
UBI/UBIFS save for one small MTD that is used for boot-time
information. I'm currently working on our tool to manipulate data on
this disk and want to ensure it is robust to bad blocks.

Looking at the UBI code, the wear-leveling subsystem marks blocks as
bad after an erase failure. Which is what I've been doing so far.

At a high level, the program does the following when we determine a
write is needed:

1. Erase PEB
2a. If erase fails, mark as bad, move to next good PEB, continue.
2b. If erase succeeds, continue
3. Write data structure.

Looking at the nandtest.c I see two paths for marking bad blocks,
First is on a failed erase, the next is on a failed write. I'm curious
if it is recommended to also mark a block as bad an erase succeeds and
a subsequent write fails.

Regards,
ZG
