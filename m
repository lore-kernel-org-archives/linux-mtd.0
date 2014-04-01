Received: from mail-ob0-f174.google.com ([209.85.214.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV0yP-0005VE-FP
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 15:51:38 +0000
Received: by mail-ob0-f174.google.com with SMTP id wo20so11254414obc.33
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 08:51:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EABA022@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-6-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EABA022@DBDE04.ent.ti.com>
Date: Tue, 1 Apr 2014 09:51:13 -0600
Message-ID: <CALnQHM0_PbB7PktUq4oZy40KOquaVu-hKrm75PJKtUWcfd2RGw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
From: David Mosberger <davidm@egauge.net>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "gsi@denx.de" <gsi@denx.de>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On Tue, Apr 1, 2014 at 12:29 AM, Gupta, Pekon <pekon@ti.com> wrote:

>>+/*
>>+ * Return the number of bits that differ between buffers SRC1 and
>>+ * SRC2, both of which are LEN bytes long.
>>+ *
>>+ * This code could be optimized for, but it only gets called on pages
>>+ * with bitflips and compared to the cost of migrating an eraseblock,
>>+ * the execution time here is trivial...
>>+ */
>>+static int
>>+bitdiff(const void *s1, const void *s2, size_t len)
>>+{
>>+      const uint8_t *src1 = s1, *src2 = s2;
>>+      int count = 0, i;
>>+
>>+      for (i = 0; i < len; ++i)
>>+              count += hweight8(*src1++ ^ *src2++);
>>+      return count;
>
> hweight8() might not be good option, how about using hweight32 ?

Why don't you read the comment above.  Yes, you can add more code
and make it faster and it will not matter one bit, so I chose to go with
the shortest code possible.  Sue me.

>>+                      flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
>>+                      ++eccpos;
>>+              }
>>+              if (flips > 0)
>>+                      mtd->ecc_stats.corrected += flips;
>>+              max_bitflips = max_t(int, max_bitflips, flips);
>>+              chkbuf += chip->ecc.size;
>>+              rawbuf += chip->ecc.size;
>>+      }
>>+
>>+      /* Re-issue the READ command for the actual data read that follows.  */
>>+      chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>>+
>
> If you refer my previous feedbacks, you could avoided this extra
> "chip->read_buf(mtd, chkbuf, read_size);" by calling it in nand_page_read_on_die();

The code you quote has no chip->read_buf call so I'm not sure how to avoid
something that isn't there.  I'm more than happy to address your concern once
I understand what it is.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
