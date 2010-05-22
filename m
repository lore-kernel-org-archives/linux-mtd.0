Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFhQr-0006NP-VH
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 05:39:34 +0000
Received: by fxm15 with SMTP id 15so1458927fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 May 2010 22:39:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] check if the start address is page-aligned.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>
In-Reply-To: <1274185390-3066-3-git-send-email-stanley.miao@windriver.com>
References: <1274185390-3066-1-git-send-email-stanley.miao@windriver.com>
	<1274185390-3066-2-git-send-email-stanley.miao@windriver.com>
	<1274185390-3066-3-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 May 2010 08:39:28 +0300
Message-Id: <1274506768.8881.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, yaffs@lists.aleph1.co.uk
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-18 at 20:23 +0800, Stanley.Miao wrote:
> Only page-aligned address is permitted in NAND subsystem.
> 
> Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>

Pushed both patches to the mtd-utils repo, thanks. However, I had to fix
a tiny white-space damage for you:

Applying: nandwrite: check if the start address is page-aligned.
/home/dedekind/git/mtd-utils/.git/rebase-apply/patch:13: trailing
whitespace.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
