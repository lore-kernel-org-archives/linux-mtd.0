Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeXhS-0002FT-Ex
	for linux-mtd@lists.infradead.org; Sun, 16 Jan 2011 18:51:39 +0000
Received: by fxm19 with SMTP id 19so5060734fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Jan 2011 10:51:36 -0800 (PST)
Subject: Re: [PATCH] mkfs.jffs2: fix devtable count as mkfs.ubifs does
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Chou <thomas@wytron.com.tw>
In-Reply-To: <1293765366-27147-1-git-send-email-thomas@wytron.com.tw>
References: <4D1C3565.1030800@wytron.com.tw>
	<1293765366-27147-1-git-send-email-thomas@wytron.com.tw>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 16 Jan 2011 20:51:33 +0200
Message-ID: <1295203893.2470.6.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-31 at 11:16 +0800, Thomas Chou wrote:
> The counting was incorrect. Follow that of mkfs.ubifs.
> 
> Signed-off-by: Thomas Chou <thomas@wytron.com.tw>

Pushed to mtd-utils git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
