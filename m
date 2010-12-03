Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POSnH-0001mQ-Iu
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 10:23:12 +0000
Date: Fri, 3 Dec 2010 11:23:07 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101203112307.131fa290@mw.dip.t-dialin.net>
In-Reply-To: <20101203110719.3a9d14f2@wker>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101203110719.3a9d14f2@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 Dec 2010 11:07:19 +0100
Anatolij Gustschin <agust@denx.de> wrote:
...
> This reset after clearing EC header and before clearing the VID
> seems to be quite rare event. I tested with your patch and with
> the mtd->writebuffer set to 64. Since no issues appeared while running

I meant "mtd->writesize" is set to 64, of course. Sorry.

Anatolij
