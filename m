Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2ji6-0006dT-Qv
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:04:35 +0000
Received: by pzk4 with SMTP id 4so6633390pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:04:32 -0700 (PDT)
Subject: Re: [PATCH 03/10] nandwrite: consolidate buffer usage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 16:07:02 +0300
In-Reply-To: <1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
	<1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315746423.18731.51.camel@sauron>
Mime-Version: 1.0
Cc: b35362@freescale.com, linux-mtd@lists.infradead.org,
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

On Wed, 2011-08-31 at 13:00 -0700, Brian Norris wrote:
> Instead of using two different output buffers for OOB data, let's just
> use the same one for all output. This adds an extra memcpy, but it
> simplifies some future work, so it's worth it.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Also pushed this one, thanks!

-- 
Best Regards,
Artem Bityutskiy
