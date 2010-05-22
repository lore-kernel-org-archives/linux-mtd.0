Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFhHk-0004AU-53
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 05:30:09 +0000
Received: by fxm15 with SMTP id 15so1456785fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 May 2010 22:30:06 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: Support 4096+64 page sizes.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Enric Balletbo i Serra <eballetbo@gmail.com>
In-Reply-To: <1274176439-22351-1-git-send-email-eballetbo@gmail.com>
References: <1274176439-22351-1-git-send-email-eballetbo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 May 2010 08:30:02 +0300
Message-Id: <1274506202.8881.30.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-18 at 11:53 +0200, Enric Balletbo i Serra wrote:
> +                       !(meminfo.oobsize == 64 && meminfo.writesize
> == 4096) &&

Are there flashes with the 4096 page / 64 spare combination? Could you
refer to one? May be any URL? I thought 4096 comes with 128.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
