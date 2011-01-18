Received: from mail-fx0-f67.google.com ([209.85.161.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf9NP-0002t1-TL
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 11:05:32 +0000
Received: by fxm17 with SMTP id 17so2545921fxm.6
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 03:05:26 -0800 (PST)
Subject: Re: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
In-Reply-To: <20110112124033.GF7105@axis.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
	<20110112124033.GF7105@axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 13:05:19 +0200
Message-ID: <1295348719.2470.126.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	linux-cris-kernel <linux-cris-kernel@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-01-12 at 13:40 +0100, Jesper Nilsson wrote:
> On Tue, Jan 11, 2011 at 12:33:38PM +0100, Dmitry Eremin-Solenikov wrote:
> > As MTD_CONCAT support is becoming an integral part of MTD core,
> > there is no need for it's special treatment. So stop checking for
> > MTD_CONCAT availability.
> > 
> > Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> 
> Looks good, I'll pull this patch into the cris-tree.
> 
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

I've put whole patch series to my l2-mtd-2.6 tree, I think it is better
to keep the CRIS patch there as well. Please, give your ack to merge the
CRIS patch via the MTD tree.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
