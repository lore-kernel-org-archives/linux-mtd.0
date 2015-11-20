Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzqNg-0005ju-Iz
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 18:25:57 +0000
Received: by iouu10 with SMTP id u10so134177233iou.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 10:25:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151119225811.GL64635@google.com>
References: <1447771824-9147-1-git-send-email-fabio.estevam@freescale.com>
 <20151119215443.GK64635@google.com>
 <CAOMZO5ADJSW446A20wO+Hv-oY9vXjtP3nG0v6hBnAA=FT_-OqA@mail.gmail.com>
 <20151119225811.GL64635@google.com>
Date: Fri, 20 Nov 2015 16:25:35 -0200
Message-ID: <CAOMZO5A2NnqoBMEcyBdEKCc2S6_q-gBqitj-u0uE4h0+LTekzA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Check the return value from read_sr()
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 8:58 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> The only remaining concern is over the mild awkwardness of comparing and
> manipulating status_old and status_new, where one is int and the other
> is u8. But I guess there are no issues yet, AFAICT.

Good point. I will change status_old and status_new to int in v2, thanks.
