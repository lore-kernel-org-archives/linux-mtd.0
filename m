Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFtkx-0001uK-Qg
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 20:58:13 +0000
Received: by yhjj52 with SMTP id j52so1143593yhj.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2012 13:58:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
References: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
Date: Thu, 5 Apr 2012 13:58:09 -0700
Message-ID: <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
Subject: Re: Query mtd-utils v1.4.9 : flash_erase.c
From: Brian Norris <computersforpeace@gmail.com>
To: Kushwaha Prabhakar-B32579 <B32579@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 5, 2012 at 2:21 AM, Kushwaha Prabhakar-B32579
<B32579@freescale.com> wrote:
> =A0I checked latest mtd-utils ver 1.4.9 for file flash_erase.c.
>
> It usage MEMGETOOBSEL ioctl to get OOB information from the driver. But t=
his ioctl may returns error for big NAND chips.
> The reason of failure would be the following condition at linux/driver/mt=
d/mtdchar.c
> =A0if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
>
> MEMGETOOBSEL has been obsolete. then Why mtd-utils still using it.

A few reasons:
(1) There is no replacement interface and there is no plan for a
replacement AFAIK (unless you count MTD_OOB_AUTO within the kernel, as
you mention).
(2) It's only used for the legacy option JFFS2 format option (-j or
--jffs2). JFFS2 isn't supported much anymore, and it probably is not
worth using on "big NAND chips." On some systems, ECC does not even
leave enough room in OOB for JFFS2.

> Also, I don't think flash_erase.c supports MTD_OOB_AUTO. Although its sup=
port is already part of Linux kernel.

What do you mean by "support MTD_OOB_AUTO" (this is actually renamed
MTD_OPS_AUTO_OOB, btw)? If you're speaking of the -j option still,
then it's probably because nobody has bothered supporting old features
on new userspace tools with new (large-OOB) chips. This would require
a developer who cares about JFFS2 to compare the various versions of
"autoplace." It wouldn't be too hard to make this use
MTD_OPS_AUTO_OOB; I just haven't studied auto/jffs2 much...

Also, aside from -j, flash_erase is only an *erase* tool, not a
formatting tool, so maybe the -j option is misplaced.

Brian
