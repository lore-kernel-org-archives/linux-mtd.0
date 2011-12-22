Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdWmm-0000sI-MI
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 00:45:29 +0000
Received: by wibhq15 with SMTP id hq15so2825823wib.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2011 16:45:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324504880-13312-1-git-send-email-w.sang@pengutronix.de>
References: <1324504880-13312-1-git-send-email-w.sang@pengutronix.de>
Date: Wed, 21 Dec 2011 16:45:25 -0800
Message-ID: <CAN8TOE8AC9R_jEj8x9fiaL3dmQbntWUka+v_zwnPEiyDKBKBNw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fix typo in comment
From: Brian Norris <computersforpeace@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 21, 2011 at 2:01 PM, Wolfram Sang <w.sang@pengutronix.de> wrote:
> Funny one :) "Heck" fits somehow, too, but I am sure it was meant to be "Check".

I agree, now that you mention it. I'd say this was a regression caused
by commit ace4dfee and perpetuated by me :)

Brian
