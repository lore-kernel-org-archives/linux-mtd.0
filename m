Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH7LB-0007u8-8O
 for linux-mtd@lists.infradead.org; Fri, 30 Jan 2015 08:54:13 +0000
Received: by mail-vc0-f181.google.com with SMTP id id10so10409096vcb.12
 for <linux-mtd@lists.infradead.org>; Fri, 30 Jan 2015 00:53:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAK6Zt3YV_x8_iCpZqrZ6_xWhkPqtBCXG=+mEEV4OEcDYJZRTA@mail.gmail.com>
References: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
 <CAAK6Zt1oKBEwJkF6pUvsOvKUG7e0GXef8AxgXqPfgoBqmBWxhg@mail.gmail.com>
 <CAAK6Zt3YV_x8_iCpZqrZ6_xWhkPqtBCXG=+mEEV4OEcDYJZRTA@mail.gmail.com>
Date: Fri, 30 Jan 2015 09:53:50 +0100
Message-ID: <CAFLxGvztjiS92k9tYi1GgEUxAKPD1A1pBfTxzbSFkdiYy_judg@mail.gmail.com>
Subject: Re: UBI on top of a smaller portion of a bigger MTD device
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Ehrenberg <dehrenberg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Cc: Nam Nguyen <namnguyen@chromium.org>, Mike Frysinger <vapier@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 30, 2015 at 2:37 AM, Daniel Ehrenberg
<dehrenberg@chromium.org> wrote:
> On Thu, Jan 29, 2015 at 5:16 PM, Daniel Ehrenberg
> <dehrenberg@chromium.org> wrote:
>> - Implement a dynamic MTD partitioning mechanism.
>
> Oh, my mistake, that's already there, just learned about the
> BLKPG_ADD_PARTITION ioctl and the fact that it works on mtd!
>
> We are always partitioning our NAND with mtd0 standing in for the
> whole device and further partitions for part of the device. Would it
> be possible to delete all partitions but mtd0 and then add the
> partitions that we want? It looks like BLKPG_ADD_PARTITION only works
> if it's called against an unpartitioned device--in this case, it'd be
> a partition whose size is size of the whole device and with offset 0.
> How would you feel about a patch to relax this constraint for just
> that type of partition? This way, if we had to repartition the device
> (in a third mode that I didn't mention, where the partitions are read
> from NOR but we're still booting from USB and reinstalling) we don't
> have to ask the user to reboot halfway through to get the partition
> table reflected.

As I explained on IRC to Nam UBI works only on mtd partitions and magic
offset games are something we definitely don't want.

With your mails the use case makes more sense, I agree that you
need some way to partition the mtd at run-time.
If we BLKPG ioctl() does not offer all the functionality you need I don't
you can extend it. Patches are welcome!

-- 
Thanks,
//richard
