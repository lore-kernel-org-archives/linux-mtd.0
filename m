Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq1kz-0003ie-2j
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 10:38:29 +0000
Received: by yxf34 with SMTP id 34so2352989yxf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 03:38:27 -0700 (PDT)
Subject: Re: [PATCH] nanddump: Fix hexdump nybble ordering
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C6ED184.1030406@broadcom.com>
References: <1282291879-28754-1-git-send-email-jon.povey@racelogic.co.uk>
	<4C6ED184.1030406@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 13:38:21 +0300
Message-ID: <1283164701.12995.48.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jon Povey <jon.povey@racelogic.co.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 12:03 -0700, Brian Norris wrote:
> On 08/20/2010 01:11 AM, Jon Povey wrote:
> > Hex dumps were being printed with the nybbles reversed since
> > commit 6ff458433ba15b8a7cb258ce64e64e98982df26e
> > Fix.
> 
> Haha, wow. I'm pretty sure that when porting the kernel function over, I 
> noticed that, then promptly ignored it. Good catch!

Just FYI, if you approve a patch, it is good to send Acked-by line which
I can copy-paste.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
