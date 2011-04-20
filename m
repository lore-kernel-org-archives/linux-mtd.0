Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCRuo-0004lQ-HU
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 07:33:35 +0000
Received: by wyb28 with SMTP id 28so464236wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Apr 2011 00:33:32 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
In-Reply-To: <BANLkTim2aXQY5YzJkadHWT_NQ2XNupTHBA@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 20 Apr 2011 10:30:33 +0300
Message-ID: <1303284633.2700.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

On Wed, 2011-04-20 at 11:19 +0800, Nicholas wrote:
> Dear Artem,
> 
> Sorry for my late reply .

Please, send proper Linux kernel patches. Hints:

1. Make a separate patch pere change, so that on modification is done by
one patch. In your case, one buffer improvement pere patch.
2. Write good commit message.
3. Use git format-patch to create patches.

> 
> #define MTD_SMALL_SIZE_PAGE_BLOCK_SIZE	0x40000 // block size for 2KB

No, please just make buffer size to be ubi->max_write_size. Kill this
constant.

> orphan.c
> In ubifs_mount_orphans()
> c->orph_buf = vmalloc((c->leb_size)/4); // for temporary

Similarly, just use ubi->max_write_size instead.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
