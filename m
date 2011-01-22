Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pgfzb-0008Cb-JM
	for linux-mtd@lists.infradead.org; Sat, 22 Jan 2011 16:07:12 +0000
Received: by bwz5 with SMTP id 5so2404979bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 Jan 2011 08:07:08 -0800 (PST)
Subject: Re: MTD concat support for linux and UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Holger Brunck <holger.brunck@keymile.com>
In-Reply-To: <4D3845AE.2040002@keymile.com>
References: <4D3845AE.2040002@keymile.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 Jan 2011 18:07:03 +0200
Message-ID: <1295712423.3712.7.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	"agust@denx.de" <agust@denx.de>, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-01-20 at 15:24 +0100, Holger Brunck wrote:
> Hi all,
> I have got a general question to the MTD concat feature in Linux. Is it allowed
> to concatenate NOR flashes with different writebuffersizes? Currently the code
> allows this.
> If so I see a problem for different sizes when dealing with UBI volumes
> comprehending such flashes. Some days ago some patches were added to adjust the
> min I/O size for UBI to the writebuffersize of the flash. If now two flashes
> with different writebuffersizes are concatenated whats the way forward? I see
> two solutions:
> 1) Using the writebuffersize from the flash with the largest writebuffer for min
> I/O size in UBI.

I think this is the way to go.

> 2) Adapting the concat feature in Linux to forbid concatenating flashes with
> different writebuffersizes.


-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
