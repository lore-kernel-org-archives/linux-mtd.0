Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SnQS3-0005KY-Dh
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2012 08:33:16 +0000
Received: by wgbds1 with SMTP id ds1so6944117wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 07 Jul 2012 01:33:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120707091447.25d735e3@pixies.home.jungo.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <4FF4005E.1070106@nod.at> <20120704143339.513439b4@pixies.home.jungo.com>
 <CACQ1gAhm-EsNPpDW26NSf-LJnxvJf0Y+tOnR9ZKPYdT_adPp7g@mail.gmail.com>
 <20120707091447.25d735e3@pixies.home.jungo.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Sat, 7 Jul 2012 10:32:45 +0200
Message-ID: <CACQ1gAjz7n6mM0U-iBdwqSJuA=dn6tDz1Py7Cd4EsxtnYKjBnQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/7/7 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> Many thanks for testing.
>
> Could you please verify the crash only occurs with the patch?
>
> Can you provide the vmlinux matching this oops, so I may analyze the
> exact null dereferencing point?
> It seems to be somewhere in ubi_wl_init, however the patch seems not to
> affect these parts of ubi...
>
> Also, what's your CONFIG_MTD_UBI_BEB_LIMIT?

I'll do that on monday.

Nice week-end !
