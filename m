Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeXhe-0002FT-Pz
	for linux-mtd@lists.infradead.org; Sun, 16 Jan 2011 18:51:51 +0000
Received: by mail-fx0-f49.google.com with SMTP id 19so5060734fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Jan 2011 10:51:50 -0800 (PST)
Subject: Re: [PATCH] mkfs.jffs2: fix repeated dev nodes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Chou <thomas@wytron.com.tw>
In-Reply-To: <1293759919-3297-1-git-send-email-thomas@wytron.com.tw>
References: <4D1C3565.1030800@wytron.com.tw>
	<1293759919-3297-1-git-send-email-thomas@wytron.com.tw>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 16 Jan 2011 20:51:47 +0200
Message-ID: <1295203907.2470.7.camel@koala>
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

On Fri, 2010-12-31 at 09:45 +0800, Thomas Chou wrote:
> Fix the repeated nodes with the same primary name in device_table.txt.
> They were not generated correctly.
> 
> /dev/tty    c    666    0    0    5    0    0    0    -
> /dev/tty    c    666    0    0    4    0    0    1    6
> 
> # IDE Devices
> /dev/hda    b    640    0    0    3    0    0    0    -
> /dev/hda    b    640    0    0    3    1    1    1    15
> /dev/hdb    b    640    0    0    3    64    0    0    -
> /dev/hdb    b    640    0    0    3    65    1    1    15
> 
> Only created,
> /dev/tty
> /dev/hda
> /dev/hdb
> 
> Signed-off-by: Thomas Chou <thomas@wytron.com.tw>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
