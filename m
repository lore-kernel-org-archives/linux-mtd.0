Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZFc0-0000ZR-Jt
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:04:25 +0000
Received: by pwi3 with SMTP id 3so443107pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 22:04:22 -0700 (PDT)
Subject: Re: [PATCH] mtd: onenand: remove redundant mtd_device_unregister
	before onenand_release
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Date: Wed, 22 Jun 2011 08:05:04 +0300
In-Reply-To: <1308308793.2628.0.camel@phoenix>
References: <1308308793.2628.0.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308719109.18119.29.camel@sauron>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-17 at 19:06 +0800, Axel Lin wrote:
> onenand_release() will call mtd_device_unregister(), thus remove the redundant
> mtd_device_unregister() call before onenand_release().
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy
