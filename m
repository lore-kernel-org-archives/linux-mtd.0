Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnu8E-0007df-Uz
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:37:59 +0000
Received: by wwb17 with SMTP id 17so2586688wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:37:57 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>, Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <1297350106-16383-3-git-send-email-agust@denx.de>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-3-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:36:48 +0200
Message-ID: <1297435008.2760.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-10 at 16:01 +0100, Anatolij Gustschin wrote:
> When initializing mtd->writebufsize, we must take into account
> possible flash chip interleaving. Wrong writebufsize initialization
> caused UBIFS recovery issues resulting in unmountable UBIFS file
> system on NOR flash partitions.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

So should I put this patch to l2 tree or you'll send another one. 

Guillaume, does this patch have your acked-by? For me it looks good.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
