Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSj6h-0006OF-Dz
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 08:22:44 +0000
Received: by mail-lb0-f175.google.com with SMTP id w7so1196518lbi.20
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 01:22:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <558570e7e38747ba93d4e2617feb14cd@SERVER75.skov.com>
References: <558570e7e38747ba93d4e2617feb14cd@SERVER75.skov.com>
Date: Wed, 26 Mar 2014 09:22:17 +0100
Message-ID: <CAAQYJAuvwnE_mxMU0phiupTUP1P3X0WNYx7FQk+3Eqe6t-YVSg@mail.gmail.com>
Subject: Re: Near full problem (old version)
From: Andrea Adami <andrea.adami@gmail.com>
To: Karsten Jeppesen <kjp@skov.dk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 24, 2014 at 8:08 AM, Karsten Jeppesen <kjp@skov.dk> wrote:
> Hi Guys,
>
> I've been using UBIFS for a long time now. Needless to say it works very well.
> However as every corner of such embedded solutions tend to fill up I am faced with a grave problem that I don't know how to get around:
>
> We are talking about the 2.6.32 kernel backport but the problem may be general anyway.
> I am formatting the NOR FLASH, then populating it.
> At the end of populating the FLASH I am reaching 100% fill and I can actually see UBIFS packing the file system, in the end reaching 93%.
> "umount" and "detach" both returns ok, but once the target has been powered off and then powers on again, the UBIFS suddenly reports errors where none were before:
>
>  [   38.100000] UBIFS error (pid 1935): ubifs_read_node: bad node type (255 but expected 1)
> [   38.140000] UBIFS error (pid 1935): ubifs_read_node: bad node at LEB 410:96096, LEB mapping status 0
> [   38.140000] UBIFS error (pid 1935): do_readpage: cannot read page 0 of inode 3090, error -22
>  [   46.670000] UBIFS error (pid 2575): ubifs_read_node: bad node type (255 but expected 1)
> [   46.700000] UBIFS error (pid 2575): ubifs_read_node: bad node at LEB 410:96096, LEB mapping status 0
> [   46.700000] UBIFS error (pid 2575): do_readpage: cannot read page 0 of inode 3090, error -22
> [   52.370000] UBIFS error (pid 2686): ubifs_read_node: bad node type (255 but expected 1)
> [   52.410000] UBIFS error (pid 2686): ubifs_read_node: bad node at LEB 410:96096, LEB mapping status 0
> [   52.410000] UBIFS error (pid 2686): do_readpage: cannot read page 0 of inode 3090, error -22
>
> It looks like inserting delays after population does influence the problem, but as of now I have no real solution.
> Can I somehow tell when UBI has ended repacking and is in a safe-to-poweroff state? (as detach is not the answer)
>
>
> Med venlig hilsen / Sincerely yours,
>
> Karsten Jeppesen, D.D.S;  Bsc. CS
> Senior Software Engineer
> Ext.: +45 72 17 56 69
> Mobile phone: +45 25 66 00 23
> ______________________________________
> SKOV A/S
> Hedelund 4, Glyngoere, 7870 Roslev, Denmark
> Tel.: +45 72 17 55 55 - Fax: +45 72 17 59 59
> www.skov.com
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


I'm using more recent kernel and very old and small NOR and I see
corruption after mount/umount cycles.
Unfortunately I couldn't fully debug it, sometimes it repairs itself
after more cycles...I suspect some race between the background
threads.

I have some debug logs here on github:
https://github.com/andrea-adami/collie-nor-flash/blob/master/debug-20140203/ubi-repair.txt

In my specific case, the definitive fixup is to disable both "Suspend
erase on write" extp->FeatureSupport &= ~512;
and "Simultaneous Operations" extp->SuspendCmdSupport &= ~1;

Suboptimal but stable.

Regards

Andrea
