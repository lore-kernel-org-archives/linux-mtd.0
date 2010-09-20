Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oxc5Z-00033L-8E
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 08:51:05 +0000
Received: by bwz19 with SMTP id 19so5954357bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 01:51:04 -0700 (PDT)
Subject: Re: [PATCH] mtd: Edit comments on deprecation of ioctl ECCGETLAYOUT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <4C9705C8.4090603@gmail.com>
References: <4C5CA4A1.1040000@broadcom.com>
	<1282154806-9420-1-git-send-email-norris@broadcom.com>
	<4C6DD170.1060807@renesas.com>  <4C6E9C23.6060703@broadcom.com>
	<1282646703.24044.162.camel@localhost>  <4C746DE0.7000104@gmail.com>
	<1283163647.12995.43.camel@brekeke> <1284830690.1721.3.camel@brekeke>
	<4C96FF10.2010805@gmail.com>  <4C9705C8.4090603@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 11:49:12 +0300
Message-ID: <1284972552.2286.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-19 at 23:57 -0700, Brian Norris wrote:
> ** Applies to l2-mtd-2.6.git: master **
> 
> There were some improvements and additions necessary in the
> comments explaining of the expansion of nand_ecclayout, the
> introduction of nand_ecclayout_user, and the deprecation of the
> ioctl ECCGETLAYOUT.
> 
> Also, I found a better placement for the macro MTD_MAX_ECCPOS_ENTRIES;
> next to the definition of MTD_MAX_OOBFREE_ENTRIES in mtd-abi.h. The macro
> is really only important for the ioctl code (found in drivers/mtd/mtdchar.c)
> but since there are small edits being made to the user-space header, I
> figured this is a better location.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd-2.6.git / master, thanks.

Note, I rebased the l2 tree an put this patch next to the "parent"
patch:

commit 728d7eef6c0ff50cb9b327ff7c02830c707f2bbc
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Tue Aug 24 18:12:00 2010 -0700

    mtd: nand: expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT

This is just more logical to keep them together.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
