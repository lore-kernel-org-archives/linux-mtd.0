Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QudwF-0007XC-2w
	for linux-mtd@lists.infradead.org; Sat, 20 Aug 2011 05:17:43 +0000
Received: by bke17 with SMTP id 17so3287292bke.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 22:17:39 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
Date: Sat, 20 Aug 2011 08:17:36 +0300
In-Reply-To: <CA+DaZUmMu5bCVCx=Ekj1QA9jQGu8t80CecQj-tAw_CKtymHoXA@mail.gmail.com>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
	<1302873423.3220.45.camel@localhost>
	<BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
	<1303031774.2308.13.camel@koala>
	<BANLkTi=We=H92+DHuJF7TPVUagePgqF48g@mail.gmail.com>
	<1303115951.2815.35.camel@localhost>
	<BANLkTim2aXQY5YzJkadHWT_NQ2XNupTHBA@mail.gmail.com>
	<1303284633.2700.3.camel@localhost>
	<CA+DaZUmMu5bCVCx=Ekj1QA9jQGu8t80CecQj-tAw_CKtymHoXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313817458.31216.4.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 14:35 +0800, Nicholas wrote:
> Dear Artem,
> 
> 1. drivers/mtd/ubi/build.c
> 
> attach_by_scanning(struct ubi_device *ubi)
> 
>         ubi->min_io_size = ubi->mtd->writesize;
>         ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
> +       ubi->max_write_size = ubi->mtd->writesize;

Could you please send a normal kernel patch with a good commit message,
e.g., produced with 'git format-patch'. Describe how you tested it as
well.

There are many internet resources describing how to send good kernel
patches.

Thanks!
