Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0rz-0004SA-8m
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:09:55 +0000
Subject: Re: [PATCH] mtd: cfi_fixup: remove unused 'param' parameter
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20101117113550.15860.31152.stgit@dev.siriade.com>
References: <20101117113550.15860.31152.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 18:09:15 +0200
Message-ID: <1290787755.2552.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Wolfram Sang <w.sang@pengutronix.de>, Nicolas Pitre <nico@fluxnic.net>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-17 at 12:35 +0100, Guillaume LECERF wrote:
> The 'param' parameter has never been used since its introduction, so
> simply remove it.
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
