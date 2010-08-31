Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqP9u-0006Z5-H2
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 11:37:49 +0000
Received: by gwb10 with SMTP id 10so3029604gwb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 04:37:45 -0700 (PDT)
Subject: Re: [PATCH 0/6] davinci: add support for aemif timing configuration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Hilman <khilman@deeprootsystems.com>
In-Reply-To: <877hj8b20x.fsf@deeprootsystems.com>
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1283082501.2131.29.camel@brekeke> <877hj8b20x.fsf@deeprootsystems.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 31 Aug 2010 14:37:40 +0300
Message-ID: <1283254660.2018.29.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	Sekhar Nori <nsekhar@ti.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-30 at 07:36 -0700, Kevin Hilman wrote:
> > Pushed to l2-mtd-2.6.git / dunno.
> 
> Hi Artem,
> 
> If it's OK with you, and with your Ack, I'd prefer to merge this series
> via the davinci tree.
> 
> The reason is because the files touched in arch/arm/mach-davinci/* are
> also getting lots of other changes for 2.6.37, and I'd like to minimize
> conflicts.

Right, I've just removed them from my tree.

> Let me know if that's OK with you and if I can add your signoff to the
> drivers/mtd/* patches.  

The MTD part is small there, feel free to add

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
