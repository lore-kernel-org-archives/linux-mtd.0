Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onqyd-00069Y-CF
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 10:43:36 +0000
Received: by bwz13 with SMTP id 13so6289069bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 03:43:33 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Deprecate ECCGETLAYOUT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1282154806-9420-1-git-send-email-norris@broadcom.com>
References: <4C5CA4A1.1040000@broadcom.com>
	<1282154806-9420-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 13:42:04 +0300
Message-ID: <1282646524.24044.161.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-18 at 11:06 -0700, Brian Norris wrote:
> The following two patches are implementations of two different
> strategies to deprecate the ioctl ECCGETLAYOUT. This ioctl is not
> very useful and imposes restrictions on expanding the corresponding
> kernel struct nand_ecclayout. Either patch will leave functionality
> intact but allow the kernel-space layouts to expand in the future.
> 
> Strategy 1: Create new struct nand_ecclayout_l and convert all kernel
>   code to use this struct.
> Strategy 2: Rename old struct nand_ecclayout_user and modify
>   nand_ecclayout to be used in the kernel only.

I think nand_ecclayout_l is silly name. Strategy 2 looks nicer, let's
stick to that one.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
