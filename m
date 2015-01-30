Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH0X7-0005kT-EA
 for linux-mtd@lists.infradead.org; Fri, 30 Jan 2015 01:38:05 +0000
Received: by mail-ie0-f171.google.com with SMTP id tr6so433045ieb.2
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2015 17:37:44 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <CAAK6Zt1oKBEwJkF6pUvsOvKUG7e0GXef8AxgXqPfgoBqmBWxhg@mail.gmail.com>
References: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
 <CAAK6Zt1oKBEwJkF6pUvsOvKUG7e0GXef8AxgXqPfgoBqmBWxhg@mail.gmail.com>
Date: Thu, 29 Jan 2015 17:37:43 -0800
Message-ID: <CAAK6Zt3YV_x8_iCpZqrZ6_xWhkPqtBCXG=+mEEV4OEcDYJZRTA@mail.gmail.com>
Subject: Re: UBI on top of a smaller portion of a bigger MTD device
From: Daniel Ehrenberg <dehrenberg@chromium.org>
To: Nam Nguyen <namnguyen@chromium.org>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Frysinger <vapier@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 29, 2015 at 5:16 PM, Daniel Ehrenberg
<dehrenberg@chromium.org> wrote:
> - Implement a dynamic MTD partitioning mechanism.

Oh, my mistake, that's already there, just learned about the
BLKPG_ADD_PARTITION ioctl and the fact that it works on mtd!

We are always partitioning our NAND with mtd0 standing in for the
whole device and further partitions for part of the device. Would it
be possible to delete all partitions but mtd0 and then add the
partitions that we want? It looks like BLKPG_ADD_PARTITION only works
if it's called against an unpartitioned device--in this case, it'd be
a partition whose size is size of the whole device and with offset 0.
How would you feel about a patch to relax this constraint for just
that type of partition? This way, if we had to repartition the device
(in a third mode that I didn't mention, where the partitions are read
from NOR but we're still booting from USB and reinstalling) we don't
have to ask the user to reboot halfway through to get the partition
table reflected.

Thanks,
Dan
