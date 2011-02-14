Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PowGr-0000A2-KO
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 11:07:10 +0000
Received: by wwb17 with SMTP id 17so4796665wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2011 03:07:08 -0800 (PST)
Subject: Re: [PATCH] mtd: jedec_probe: initialise make sector erase command
	variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <AANLkTikD3sWpuLGr6De3k7Hr-QZc_N0P+6F5xd=JJfR6@mail.gmail.com>
References: <1297418437-23553-1-git-send-email-antony@niisi.msk.ru>
	<1297436787.2760.47.camel@localhost>
	<AANLkTikD3sWpuLGr6De3k7Hr-QZc_N0P+6F5xd=JJfR6@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Feb 2011 13:05:58 +0200
Message-ID: <1297681558.2854.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, Antony Pavlov <antony@niisi.msk.ru>,
	linux-mtd@lists.infradead.org, w.sang@pengutronix.de,
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

On Mon, 2011-02-14 at 11:16 +0100, Guillaume LECERF wrote:
> Hi.
> 
> 2011/2/11 Artem Bityutskiy <dedekind1@gmail.com>:
> > Pushed to l2-mtd-2.6.git, thanks.
> 
> Maybe it should be sent to -stable ?

OK, I'll add a "cc stable" tag,

thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
