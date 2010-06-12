Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONPAd-0002WO-A3
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 11:46:40 +0000
Subject: Re: [PATCH] mtd-utils: Support 4096+64 page sizes.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Enric Balletbo i Serra <eballetbo@gmail.com>
In-Reply-To: <1274176439-22351-1-git-send-email-eballetbo@gmail.com>
References: <1274176439-22351-1-git-send-email-eballetbo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 14:43:34 +0300
Message-ID: <1276343014.19028.117.camel@localhost>
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
> From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
> 
> Add support for oobsize 64 and writesize 4096 in nanddump & nandwrite.
> 
> Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
> ---
>  nanddump.c  |    1 +
>  nandwrite.c |    1 +

Pushed to mtd-utils.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
