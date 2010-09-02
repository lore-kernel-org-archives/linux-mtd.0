Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or8Eq-0002lD-Nv
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:45:53 +0000
Received: by gwb10 with SMTP id 10so101625gwb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 04:45:52 -0700 (PDT)
Subject: Re: UBIFS in-place vs out-of-place GC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russ Dill <russ.dill@gmail.com>
In-Reply-To: <AANLkTimuZZ-B1sO1jHAu_gjwa8Gb_WXKowORNvWHMmcT@mail.gmail.com>
References: <AANLkTimuZZ-B1sO1jHAu_gjwa8Gb_WXKowORNvWHMmcT@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 14:45:48 +0300
Message-ID: <1283427948.3085.19.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2010-09-01 at 09:08 -0700, Russ Dill wrote:
> I'm doing a bit of research on UBIFS and something I read from a few
> sources has me confused regarding garbage collection:
> 
> http://osl.sed.hu/~havasi/ubifs/#gc

You should contact Szeged guys and ask them to remove obsolete
information.

For much more up-to-date information, see
http://linux-mtd.infradead.org/doc/ubifs.html#L_documentation

> Looking at the source, I can find the code that does the out of place
> updates, but I can't find any references to in place updates or
> displacement tables. What gives?

We do not have displacement tables, that was some old idea which we
never implemented.

We do not have in-place GC in UBIFS. But we have so-called "in-the-gaps"
method which we use during commit to write the FS index when we do not
have extra empty LEBs. In the code it corresponds to the
'layout_in_gaps()' function.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
