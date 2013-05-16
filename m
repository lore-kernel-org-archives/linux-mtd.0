Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UctZ0-0003A7-Jm
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 08:29:28 +0000
Received: by mail-wg0-f51.google.com with SMTP id b13so2319748wgh.18
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2013 01:29:04 -0700 (PDT)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C4EC5@DBDE04.ent.ti.com>
References: <1368684720-26763-1-git-send-email-pekon@ti.com>
 <1368684720-26763-3-git-send-email-pekon@ti.com>
 <CAGGh5h16kxdPRtPQ4vRzLA4iMxjTurPpdzBiEHaM9zb+y8fJBg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C4EC5@DBDE04.ent.ti.com>
Date: Thu, 16 May 2013 10:29:04 +0200
Message-ID: <CAGGh5h3WGGRcQgpns7EOso1yqvrzKmCAbQo9XZoMyhv0Q1KT4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: OMAP2+: cleaned-up DT support of various ECC
 schemes
From: jean-philippe francois <jp.francois@cynove.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "arnd@arndb.de" <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/16 Gupta, Pekon <pekon@ti.com>:
>> >
>>
>> OMAP_ECC_BCH4_CODE_HW_DETECTION_SW and
>> OMAP_ECC_BCH4_CODE_HW
>> seems to exist in the code, but are not in the changelog, and not in
>> the device tree binding documentation.
>>
>
> Yes, I plan to omit them from code also, in next series as it does not
> make sense to support both BCH4 and BCH8 at same time, when most
> users would opt for BCH8.
> Also, BCH4 was kept for legacy purposes, and was not tested on all device=
s.
> Therefore I have purposely omitted it from documentation.
>

We have shipped devices with BCH4 nand.  This would be a regression for us.

Regards,
Jean-Philippe Fran=C3=A7ois.

> with regards, pekon
