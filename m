Received: from mail-ia0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQSY6-00054B-6k
 for linux-mtd@lists.infradead.org; Tue, 23 Oct 2012 00:40:50 +0000
Received: by mail-ia0-f177.google.com with SMTP id x26so2597349iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2012 17:40:47 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 22 Oct 2012 17:40:47 -0700
Message-ID: <CAJ+oik26oPY+AwN=LwkM-suW9WddZo09kSZX_4FpxTtH+NttqQ@mail.gmail.com>
Subject: mtd: onenand: 8Gb SDP/DDP support
From: Bryan Hundven <bryanhundven@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list,

Please cc: me, as I am not currently subscribed. Thank you!

I have been looking around for official changes from Samsung for their
8Gb (1GB) flash parts, and find a driver from a samsung phone called:
samsung_audi.c:

https://github.com/arighi/linux-gt-i9100/blob/master/drivers/mtd/onenand/samsung_audi.c

But, I'd rather use something that gets updated regularly by those who
know more about these chips.

I am wondering if there are any plans to support these chips in the
upstream kernel.

Thanks in advance,

-Bryan
