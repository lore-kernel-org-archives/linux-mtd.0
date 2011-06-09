Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUeKB-0006Fu-5V
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:26:59 +0000
Received: by fxm14 with SMTP id 14so1315008fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 05:26:56 -0700 (PDT)
Subject: Re: [PATCH] mtd: edb7312: correctly pass MTD name to parsers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307616881-13941-1-git-send-email-dbaryshkov@gmail.com>
References: <1307616881-13941-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 15:22:37 +0300
Message-ID: <1307622157.7374.82.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 14:54 +0400, Dmitry Eremin-Solenikov wrote:
> cmdline partitions parser expects MTD name at mtd->name, instead of
> origin, while edb7312 passes MTDID as origin. Fix that.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
