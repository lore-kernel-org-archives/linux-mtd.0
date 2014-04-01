Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV2WA-0008UY-L4
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 17:30:36 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so10228013pab.10
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 10:30:11 -0700 (PDT)
Date: Tue, 1 Apr 2014 10:30:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
Message-ID: <20140401173007.GH29542@ld-irv-0074>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-6-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EABA022@DBDE04.ent.ti.com>
 <CALnQHM0_PbB7PktUq4oZy40KOquaVu-hKrm75PJKtUWcfd2RGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM0_PbB7PktUq4oZy40KOquaVu-hKrm75PJKtUWcfd2RGw@mail.gmail.com>
Cc: "gsi@denx.de" <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 01, 2014 at 09:51:13AM -0600, David Mosberger wrote:
> On Tue, Apr 1, 2014 at 12:29 AM, Gupta, Pekon <pekon@ti.com> wrote:
> >>+/*
> >>+ * Return the number of bits that differ between buffers SRC1 and
> >>+ * SRC2, both of which are LEN bytes long.
> >>+ *
> >>+ * This code could be optimized for, but it only gets called on pages
> >>+ * with bitflips and compared to the cost of migrating an eraseblock,
> >>+ * the execution time here is trivial...
> >>+ */
> >>+static int
> >>+bitdiff(const void *s1, const void *s2, size_t len)
> >>+{
> >>+      const uint8_t *src1 = s1, *src2 = s2;
> >>+      int count = 0, i;
> >>+
> >>+      for (i = 0; i < len; ++i)
> >>+              count += hweight8(*src1++ ^ *src2++);
> >>+      return count;
> >
> > hweight8() might not be good option, how about using hweight32 ?
> 
> Why don't you read the comment above.  Yes, you can add more code
> and make it faster and it will not matter one bit, so I chose to go with
> the shortest code possible.  Sue me.

I'm guilty of making the same comment, and it really isn't warranted in
some cases where simplicity should win. I'm fine taking this piece
as-is, I suppose, since it likely experiences a low bit-error rate. But
I would caution that bit errors are becoming increasingly common, so
your "trivial" comment may not age well.

> >>+                      flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
> >>+                      ++eccpos;
> >>+              }
> >>+              if (flips > 0)
> >>+                      mtd->ecc_stats.corrected += flips;
> >>+              max_bitflips = max_t(int, max_bitflips, flips);
> >>+              chkbuf += chip->ecc.size;
> >>+              rawbuf += chip->ecc.size;
> >>+      }

Brian
