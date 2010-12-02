Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNzq4-0006YA-3g
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:28:09 +0000
Received: by fxm19 with SMTP id 19so2860488fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:28:06 -0800 (PST)
Subject: Re: [PATCH 1/8] nanddump/nandwrite: use "simple_" str functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:27:08 +0200
Message-ID: <1291260428.14534.2.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-29 at 00:01 -0800, Brian Norris wrote:
> Per Mike Frysinger's suggestion, we check for strtoll() and strtoull()
> errors by using the "common.h" helper functions simple_strtoll() and
> simple_strtoull().
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed the series, picked newest patches, thanks a lot!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
