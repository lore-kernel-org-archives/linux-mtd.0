Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqlc0-0008Dd-8l
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 11:36:19 +0000
Received: by gyg8 with SMTP id 8so3615269gyg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 04:36:15 -0700 (PDT)
Subject: Re: mkfs.ubifs generating bad CRCs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903E02E09@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE0903E02E09@Cloud.RL.local>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 14:36:06 +0300
Message-ID: <1283340966.1958.21.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-31 at 11:57 +0100, Jon Povey wrote:
> Building mkfs.ubifs from today's mtd-utils git I get a mkfs.ubifs that seems to generate bad CRCs.
> I also have ubuntu's binary mtd-utils installed which produce good CRCs. I tested using both versions of mkfs.ubifs and only ubuntu's ubinize for both images, so can confirm ubinize is not a problem.
> 
> Related sounding thing I found:
> http://lists.infradead.org/pipermail/linux-mtd/2010-July/031187.html
> 
> After flashing the image from git mkfs.ubifs I get this on my console:

Fixed in current mtd-utils.git

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
