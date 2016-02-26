Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZCyS-0001BT-NA
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 07:38:05 +0000
Received: by mail-oi0-x231.google.com with SMTP id k67so283735oia.3
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 23:37:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACwgvgU05i7-72bgWeY3uAx1DFotJ2j3zBz2wDz3-ujeGBm6aQ@mail.gmail.com>
References: <CACwgvgU05i7-72bgWeY3uAx1DFotJ2j3zBz2wDz3-ujeGBm6aQ@mail.gmail.com>
Date: Fri, 26 Feb 2016 08:37:43 +0100
Message-ID: <CAFLxGvzexRdwQJn5KcR6YpFNH3DZAJC17nkGjJ0v=kHRDHx28w@mail.gmail.com>
Subject: Re:
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Fredrick Prashanth John Berchmans <fredrickprashanth@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Suresh Siddha <sbsiddha@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 26, 2016 at 2:19 AM, Fredrick Prashanth John Berchmans
<fredrickprashanth@gmail.com> wrote:
> We are using UBIFS on our NOR flash.
> We are observing that a lot of times the filesystem goes to read-only
> unable to recover.
> Most of the time its due to
> a) ubifs_scan_a_node failing due to bad crc or unclean free space.
> b) ubifs_leb_write failing to erase due to erase timeout
>
> [ The above would have happened due to unclean power cuts. In our
> environment this happens often ]
>
> I checked the code in jffs2. Looking at jffs2 code it looks like jffs2
> tolerates the above two
> failures and moves on without mounting read-only.
> Is my understanding right ?
>
> Could we change the ubifs_scan_a_node to skip corrupted bytes and move
> to next node,
> instead of returning error ?

Not without a detailed analysis what exactly is going on.
It sounds more like ad-hoc hack. :-)

-- 
Thanks,
//richard
