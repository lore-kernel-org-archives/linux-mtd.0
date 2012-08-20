Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3PBZ-0007qx-QR
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 10:26:19 +0000
Received: by lagu2 with SMTP id u2so3030974lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 03:26:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345215442-19082-2-git-send-email-richard.genoud@gmail.com>
References: <1345215442-19082-1-git-send-email-richard.genoud@gmail.com>
 <1345215442-19082-2-git-send-email-richard.genoud@gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 12:25:55 +0200
Message-ID: <CACQ1gAhv2mk-W2kxigFqUFjEbSMQTY9P2+vxmkgxFCLtumWVyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] sync include/mtd/ubi-user.h with kernel v3.6-rc1
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/17 Richard Genoud <richard.genoud@gmail.com>:
>  /*
> - * UBI data type hint constants.
> - *
> - * UBI_LONGTERM: long-term data
> - * UBI_SHORTTERM: short-term data
> - * UBI_UNKNOWN: data persistence is unknown
> - *
> - * These constants are used when data is written to UBI volumes in order to
> - * help the UBI wear-leveling unit to find more appropriate physical
> - * eraseblocks.
> - */
> -enum {
> -       UBI_LONGTERM  = 1,
> -       UBI_SHORTTERM = 2,
> -       UBI_UNKNOWN   = 3,
> -};
Sorry, I didn't pay attention to that (I must have compiled without a
make clean).
mtd-utils should be updated not to use dtype anymore.
If it's as simple as that, I can update it.

Richard.
