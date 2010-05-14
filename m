Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OCpyB-0004Bw-Eo
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 08:10:08 +0000
Received: by fxm12 with SMTP id 12so911867fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 May 2010 01:10:04 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1273823642.9999.1528.camel@macbook.infradead.org>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
	<20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
	<1273796379.9999.509.camel@macbook.infradead.org>
	<4BECEAE9.2030008@free.fr>
	<1273823642.9999.1528.camel@macbook.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 14 May 2010 10:09:44 +0200
Message-ID: <AANLkTik9nUPxig-XFRnVn8O3B45ofHraUMe6xPkPGMYW@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot bank
	location
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd <linux-mtd@lists.infradead.org>, Chris Moore <moore@free.fr>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/5/14 David Woodhouse <dwmw2@infradead.org>:
> http://git.infradead.org/mtd-2.6.git/commitdiff/412da2f6

Thanks David.

One thing I noted :

+                       if ((bootloc < 2) || (bootloc > 5)) {
+                               printk(KERN_WARNING "%s: CFI contains
unrecognised boot "
+                                      "bank location (%d). Assuming bottom.\n",
+                                      bootloc, map->name);

I think bootloc and map->name need to be swapped to match the printk
pattern order (%s first then %d).

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
