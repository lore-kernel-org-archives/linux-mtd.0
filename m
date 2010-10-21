Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8vo3-0005h4-IG
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 14:07:51 +0000
Received: by gwj17 with SMTP id 17so108055gwj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 07:07:44 -0700 (PDT)
Subject: Re: [PATCH] [MTD] cfi_cmdset_0002: code cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <AANLkTi=kX7aAbY-5XNF0dKngXmAPXL-UisGGfjOimKdo@mail.gmail.com>
References: <1287233782-21319-1-git-send-email-w.sang@pengutronix.de>
	<AANLkTi=kX7aAbY-5XNF0dKngXmAPXL-UisGGfjOimKdo@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Oct 2010 17:01:54 +0300
Message-ID: <1287669714.2932.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, yidong zhang <zhangyd6@gmail.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-21 at 12:40 +0200, Guillaume LECERF wrote:
> 2010/10/16 Wolfram Sang <w.sang@pengutronix.de>:
> > - remove disabled code (hasn't been touched since the beginning of git
> >  and should be reimplemented if really needed)
> > - convert remaining c++-comments to plain c-style
> >
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > Cc: yidong zhang <zhangyd6@gmail.com>
> > Cc: Guillaume LECERF <glecerf@gmail.com>
> > Cc: David Woodhouse <David.Woodhouse@intel.com>
> 
> Acked-by: Guillaume LECERF <glecerf@gmail.com>

Added your ack to my tree as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
