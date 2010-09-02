Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or7dK-0006BJ-BH
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:07:07 +0000
Received: by ywi4 with SMTP id 4so144491ywi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 04:07:05 -0700 (PDT)
Subject: Re: [PATCH] NAND: split ONFI detection logic to its own function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
In-Reply-To: <201009012229.00660.ffainelli@freebox.fr>
References: <201009012229.00660.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 14:07:03 +0300
Message-ID: <1283425623.3085.7.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 22:28 +0200, Florian Fainelli wrote:
> In order to reduce the indentation and improve the readability of nand_get_
> flash_type, split the ONFI detection logic to its own function. The detection
> logic inside nand_flash_detect_onfi is also rewritten to allow for less
> indentation.
> 
> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>

Pushed to l2-mtd-2.6.git / dunno, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
