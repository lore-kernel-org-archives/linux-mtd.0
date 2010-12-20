Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUdqB-00010O-47
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2010 11:23:47 +0000
Received: by bwz14 with SMTP id 14so2996117bwz.30
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Dec 2010 03:23:39 -0800 (PST)
Subject: Re: mtd: fix CONFIG_MTD_COMPLEX_MAPPINGS=n compile
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Lunz <lunz@acm.org>
In-Reply-To: <20101219190720.GA16710@falooley.org>
References: <20071227181524.GA19051@falooley.org>
	<20071228174853.GA4252@uranus.ravnborg.org>
	<20101207072919.GA8511@falooley.org>
	<AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
	<20101207182012.GA10546@falooley.org>
	<1292343878.2538.80.camel@localhost>
	<20101214195124.GA6010@falooley.org> <20101216230110.65156c55@wker>
	<20101217042759.GA3148@falooley.org> <1292777276.2140.1.camel@koala>
	<20101219190720.GA16710@falooley.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Dec 2010 13:23:36 +0200
Message-ID: <1292844216.13362.19.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-12-19 at 14:07 -0500, Jason Lunz wrote:
> You should also drop the changes that
> 7bc3265a9e9a09d6a9a3cfaaf53ccf3af5271a93 made to drivers/mtd/mtdchar.c -
> there's no point changing that when mtdchar is disabled on ARCH=um.

Ok, could you please re-sent the final patch with the commit message
etc?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
