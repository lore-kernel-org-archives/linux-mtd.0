Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7CG8-0002LD-WA
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 19:17:37 +0000
Received: by bwz7 with SMTP id 7so2562254bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 12:17:35 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] mtd: m25p80: add support to parse the
	partitions by OF node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mingkai Hu <Mingkai.hu@freescale.com>
In-Reply-To: <1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
References: <1286878714-13090-1-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-2-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-3-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-4-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-5-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Oct 2010 22:17:27 +0300
Message-ID: <1287256647.1781.34.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: david-b@pacbell.net, kumar.gala@freescale.com, grant.likely@secretlab.ca,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net, tie-fei.zang@freescale.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-12 at 18:18 +0800, Mingkai Hu wrote:
> Signed-off-by: Mingkai Hu <Mingkai.hu@freescale.com>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> v4:
>  - Updated to latest kernel base(Linux 2.6.36-rc7).
>  - Made changes according to Grant's comments.

Looks good to me, pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
