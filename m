Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghwAh-0001cu-TG
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 12:44:25 +0000
From: Richard Weinberger <richard@nod.at>
To: Shibin George <george.shibin1993@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: gluebi vs. ubi-volume mapping
Date: Fri, 11 Jan 2019 13:44:12 +0100
Message-ID: <1835331.mx3o4XuZP5@blindfold>
In-Reply-To: <CAGu8XfQ_iVh-5zb_h5FAi=wHifC+Drf1CPZbdiAzCXtjOoQmXg@mail.gmail.com>
References: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
 <CAFLxGvwy7cNdjEqFujHX5LY-42A3V-Moogxj3NNyguPQp_ijEg@mail.gmail.com>
 <CAGu8XfQ_iVh-5zb_h5FAi=wHifC+Drf1CPZbdiAzCXtjOoQmXg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 11. Januar 2019, 13:42:11 CET schrieb Shibin George:
> > BTW: Why are you using glubi+mtdblock at all? To support squashfs we
> > have ubiblock.
> > That way you can use read-only block-based filesystems directly on top
> > of UBI without glubi
> > and mtdblock.
> ubiblock, being read-only, didn't satisfy my requirement.
> The device I am working on needs to have block-level software upgrade
> capability.
> So gluebi was the best solution that I could find that can run block-based
> filesystem.

Usually you don't want such a deep stacking on an embedded system.
But you are aware of ubiupdatevol?

Thanks,
//richard
