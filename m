Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUNKd-00061H-PG
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 17:46:04 +0000
Received: by mail-bw0-f43.google.com with SMTP id 14so2470097bwz.30
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Dec 2010 09:46:03 -0800 (PST)
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1292539339-25111-3-git-send-email-agust@denx.de>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 19:45:57 +0200
Message-ID: <1292780757.13362.17.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-16 at 23:42 +0100, Anatolij Gustschin wrote:
> Initialize mtd->writebufsize to the value obtained
> by CFI query command at probe time.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Pushed patches 2-5 as is.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
