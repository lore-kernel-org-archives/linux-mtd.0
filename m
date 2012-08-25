Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5CqT-0005P3-MF
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 09:39:58 +0000
Received: by wgbdt14 with SMTP id dt14so742654wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 02:39:54 -0700 (PDT)
Date: Sat, 25 Aug 2012 12:42:49 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
Message-ID: <20120825124249.6aab8f9e@halley>
In-Reply-To: <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 25 Aug 2012 05:26:51 -0400 Huang Shijie <shijie8@gmail.com> wrote:
> > The specified cmdline partitions might not be ordered (according to
> > start offset), so next partition specified after the truncated one might
> > define a partition at the beginning of the device, which is okay
> > (regardless the truncation of current partition).
> could you please give me an example of this specified cmdline?

Assume we have a 1GB(8Gb) nand chip:
  #gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)

I am used to explicitly specify size@offset for all my parts.

Obviously I won't define a partition above the device size... somewhat
hypothetical discussion here...

But your code will stop after creating 'rootfs' (and original code will
not create a single partition).

Is that what we want?

Or do we want to truncate 'rootfs', but still have the valid 'boot' and
'kerner' partitions?

Regards,
Shmulik
