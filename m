Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SnOIf-0004Wp-Bl
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2012 06:15:34 +0000
Received: by werb13 with SMTP id b13so4738173wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2012 23:14:58 -0700 (PDT)
Date: Sat, 7 Jul 2012 09:14:47 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
Message-ID: <20120707091447.25d735e3@pixies.home.jungo.com>
In-Reply-To: <CACQ1gAhm-EsNPpDW26NSf-LJnxvJf0Y+tOnR9ZKPYdT_adPp7g@mail.gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <4FF4005E.1070106@nod.at>
 <20120704143339.513439b4@pixies.home.jungo.com>
 <CACQ1gAhm-EsNPpDW26NSf-LJnxvJf0Y+tOnR9ZKPYdT_adPp7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Richard,

On Fri, 6 Jul 2012 17:27:59 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
> I've got an oops...
> this is my dev-kernel in 3.5-rc5 + some work to be able to boot on my board
> NB: If I use ubi_format it's ok.
> the mtd1 device has 1984 PEB
> the 4 last are UBI reserved + BBT
> 
> I didn't test without your patch, but anyway something is wrong there.

Many thanks for testing.

Could you please verify the crash only occurs with the patch?

Can you provide the vmlinux matching this oops, so I may analyze the
exact null dereferencing point?
It seems to be somewhere in ubi_wl_init, however the patch seems not to
affect these parts of ubi...

Also, what's your CONFIG_MTD_UBI_BEB_LIMIT?

Regards,
Shmulik
