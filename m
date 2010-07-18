Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaOHb-0004M4-UK
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 07:27:32 +0000
Received: by fxm3 with SMTP id 3so1933478fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 00:27:30 -0700 (PDT)
Subject: Re: [PATCH 1/6] Mtd: fixed coding style indent errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Neal B <nealb001@gmail.com>
In-Reply-To: <4C3A8220.6040707@gmail.com>
References: <4C3A8220.6040707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 10:27:26 +0300
Message-Id: <1279438046.16247.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, maximlevitsky@gmail.com,
	cascardo@holoscopio.com, linux-kernel@vger.kernel.org,
	Julia Lawall <julia@diku.dk>, linux-mtd@lists.infradead.org,
	jkosina@suse.cz, mohanlaljangir@gmail.com,
	rmk+kernel@arm.linux.org.uk, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-07-11 at 21:46 -0500, Neal B wrote:
> From f4301b9c13f65d173d67759d53acaf3e8d2331c6 Mon Sep 17 00:00:00 2001
> From: Neal Buckendahl <nealb001@gmail.com>
> Date: Sun, 11 Jul 2010 16:58:24 -0500
> Subject: [PATCH 1/6] Mtd: fixed coding style indent errors found by the 
> checkpatch.pl tool
>   Signed-off-by: Neal Buckendahl <nealb001@gmail.com>

Unfortunately, your patches are line-wrapped. You should send
non-wrapped patches. Use git send-email - it can do the trick (use
--dry-run first, check everything is fine, then send).

Also, int the commit message, it is a bit better to specify which
exactly warning it fixes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
