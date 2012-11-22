Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbUtf-0005Z5-R7
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:24:45 +0000
Received: by mail-oa0-f49.google.com with SMTP id l10so7804166oag.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 03:24:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
References: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
Date: Thu, 22 Nov 2012 12:24:22 +0100
Message-ID: <CAJA4uhezA7uc2x-fxJ1YLJZH2DX5HWFi=+4DgVowDW+FDZ0rUw@mail.gmail.com>
Subject: Re: UBIFS: Advice request on how to reduce orph_buf size
To: MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For anyone interested, we chose to limit the number of orphan
depending on orph_buf size so we can tune the number of orphan we can
create depending on our memory constraints. I don't think it's a
change that should be integrated in the mainline but if someone wants
to see the patch, I should be able to provide it.

2012/11/16 Josselin Costanzi <josselin.costanzi@mobile-devices.fr>:
> Hi,
> In order to reduce UBIFS memory consumption when used in RW I'm trying to
> reduce orph_buf size from one LEB to max_write_size. I changed avail_orphs and
> tot_avail_orphs functions to report correct orphan counts but I'm now stuck
> with the consolidate function. I don't see how I could atomically write all my
> orphans in a new LEB with a max_write_size sized orph_buf. One potential
> solution would be to try allocating a LEB sized buffer only when consolidating
> the orphans but this means commit_orphans may now fail due to memory exhaustion.
>
> Have any of you an idea on how to correctly do this? What would be an acceptable
> solution?
>
> Regards,
> Josselin Costanzi
> Embedded Linux System Engineer



-- 
Josselin Costanzi
  Embedded Linux System Engineer
