Received: from mail-fx0-f67.google.com ([209.85.161.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PfANI-0007JI-8u
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 12:09:36 +0000
Received: by fxm17 with SMTP id 17so2570716fxm.6
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 04:09:19 -0800 (PST)
Subject: Re: [PATCH 12/16] mtd: mpc5121_nfc: don't treat NULL clk as an error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1294749833-32019-13-git-send-email-jamie@jamieiles.com>
References: <1294749833-32019-1-git-send-email-jamie@jamieiles.com>
	<1294749833-32019-13-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 14:09:13 +0200
Message-ID: <1295352553.2470.132.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vincent Sanders <support@simtec.co.uk>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-11 at 12:43 +0000, Jamie Iles wrote:
> clk_get() returns a struct clk cookie to the driver and some platforms
> may return NULL if they only support a single clock.  clk_get() has only
> failed if it returns a ERR_PTR() encoded pointer.
> 
> Cc: Vincent Sanders <support@simtec.co.uk>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
