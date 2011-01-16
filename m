Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeaTF-0000C6-Mu
	for linux-mtd@lists.infradead.org; Sun, 16 Jan 2011 21:49:10 +0000
Received: by fxm19 with SMTP id 19so5202274fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Jan 2011 13:49:08 -0800 (PST)
Subject: Re: [PATCH] New ubitunefs command to adjust tunable filesystem
	parameters on ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1293790128-4986-1-git-send-email-stefani@seibold.net>
References: <1293790128-4986-1-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 16 Jan 2011 23:49:05 +0200
Message-ID: <1295214545.2470.16.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Artem.Bityutskiy@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-31 at 11:08 +0100, stefani@seibold.net wrote:
> +"-d, --devn=<UBI device number>  UBI device number to get information about\n"
> +"-n, --vol_id=<volume ID>        ID of UBI volume to print information about\n"
> +"-N, --name=<volume name>        name of UBI volume to print information about\n" 

These commentaries should be tweaked I think.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
