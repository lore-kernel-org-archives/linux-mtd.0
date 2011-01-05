Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaPOY-0004kK-IV
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 09:11:03 +0000
Received: by bwz5 with SMTP id 5so15517158bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 01:11:01 -0800 (PST)
Subject: Re: [PATCH 1/1] m25p80: Fix JEDEC ID for AT26DF321
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>
In-Reply-To: <1294130555-12762-1-git-send-email-aleksandr.koltsoff@ebts.fi>
References: <1294130555-12762-1-git-send-email-aleksandr.koltsoff@ebts.fi>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 11:10:57 +0200
Message-ID: <1294218657.2179.18.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: g.chen@freescale.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-04 at 10:42 +0200, Aleksandr Koltsoff wrote:
> The last byte of the ID should be zero for this chip. Was added in
> commit d0e8c47c58575b9131e786edb488fd029eba443e . Reported by Tomi
> Varjo.
> 
> Signed-off-by: Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
