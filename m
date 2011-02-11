Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnv0I-0000JJ-LB
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:33:51 +0000
Received: by fxm19 with SMTP id 19so2892623fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 07:33:49 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1297350106-16383-3-git-send-email-agust@denx.de>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-3-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 17:32:30 +0200
Message-ID: <1297438351.2760.63.camel@localhost>
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

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
