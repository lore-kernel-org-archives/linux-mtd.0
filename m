Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1So7vr-0006t6-0q
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 06:59:05 +0000
Received: by werb13 with SMTP id b13so5814439wer.36
 for <linux-mtd@lists.infradead.org>; Sun, 08 Jul 2012 23:58:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120707091447.25d735e3@pixies.home.jungo.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <4FF4005E.1070106@nod.at> <20120704143339.513439b4@pixies.home.jungo.com>
 <CACQ1gAhm-EsNPpDW26NSf-LJnxvJf0Y+tOnR9ZKPYdT_adPp7g@mail.gmail.com>
 <20120707091447.25d735e3@pixies.home.jungo.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 9 Jul 2012 08:58:28 +0200
Message-ID: <CACQ1gAjFGTZ8DriQ_4fU0GWKZ24xbfn_Jus38CgPvjdPFypnkw@mail.gmail.com>
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

Hi !
I can't reproduce it...
Maybe the problem was between the chair and the keyboard.
Anyway, if I ran into it again, I'll let you know.

Richard.
