Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzY0T-0005ME-Gj
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 22:48:45 +0000
Received: by iouu10 with SMTP id u10so107358521iou.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 14:48:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151119215443.GK64635@google.com>
References: <1447771824-9147-1-git-send-email-fabio.estevam@freescale.com>
 <20151119215443.GK64635@google.com>
Date: Thu, 19 Nov 2015 20:48:23 -0200
Message-ID: <CAOMZO5ADJSW446A20wO+Hv-oY9vXjtP3nG0v6hBnAA=FT_-OqA@mail.gmail.com>
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

On Thu, Nov 19, 2015 at 7:54 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> Hmm, by changing status_old from u8 to int, do we propagate any
> sign-extension issues in this function? What if BIT(7) is set? If I

If the value returned by read_sr() has BIT(7) set then it is not an
error, right?

read_sr() can return negative on error and u8 on success.

Not sure I understand your concern.
