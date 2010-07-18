Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaPTo-0000l7-FC
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 08:44:13 +0000
Received: by fxm3 with SMTP id 3so1948937fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 01:44:11 -0700 (PDT)
Subject: Re: [PATCH] s3c nand: parsing commad-line partitions prior to
	set->partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Conke Hu <conke@maxwit.com>
In-Reply-To: <1278996990-4380-1-git-send-email-conke@maxwit.com>
References: <1278996990-4380-1-git-send-email-conke@maxwit.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 11:44:08 +0300
Message-Id: <1279442648.16247.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: support@simtec.co.uk, linux-mtd@lists.infradead.org, linux@simtec.co.uk,
	ben-linux@fluff.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 12:56 +0800, Conke Hu wrote:
> Current driver prevents command-line partitions from being parsed when built-in 
> partitions are defined in s3c2410_nand_set object, but it is not desirable in some 
> cases. This patch tries to parse commad-line partitions prior to the built-in.
> 
> Signed-off-by: Conke Hu <conke@maxwit.com>

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
