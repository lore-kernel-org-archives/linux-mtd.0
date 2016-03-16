Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agKcD-00067K-MX
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2016 23:12:34 +0000
Received: by mail-oi0-x22d.google.com with SMTP id r187so50549111oih.3
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2016 16:12:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
Date: Thu, 17 Mar 2016 00:12:11 +0100
Message-ID: <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
Subject: Re: UBIFS question
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 16, 2016 at 10:54 AM, Martin Townsend
<mtownsend1973@gmail.com> wrote:
> I have an board with a 512MB Raw NAND flash memory device and 4GB
> Managed eMMC flash memory device.  I would like to take advantage of
> this and maintain a root filesystem on each and keep them in sync so
> upgrades will upgrade each filesystem.  I can then use one of them as
> a redundant image that can be used to correct the primary one or fail
> over on device failure.  I have UBIFS on the raw NAND flash and ext3
> on the eMMC flash.  My first thought was can I create a mirror using
> raid but after researching it looks like the linux SW raid, although
> very flexible, only supports block devices which rules out UBIFS.  I
> could see some mails about a block device layer for UBI but I seem to
> remember that this was read only or had certain restrictions.
>
> Next I thought about maybe using Docker so I could switch between the
> 2 filesystems but saw a mail that UBIFS doesn't support WHITEOUT
> feature that docker would require from the underlying filesystem as it
> uses union/overlay filesystems.
>
> Just wanted to check that these assumptions are correct and I haven't
> missed something and also if anyone knows of another method I would be
> very interested in hearing it.

Yes, you cannot do RAID1 between MTD and block devices.
And yes, overlayfs does not fully work these day on UBIFS but I'm working on it,
at least it is on my TODO list and I have some patches on my disk..

Why can't you just rsync between the filesystems?

-- 
Thanks,
//richard
