Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNPAY-0006Ja-MN
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 12:51:07 +0000
Received: by wwb39 with SMTP id 39so2872380wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 05:51:04 -0700 (PDT)
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Maxin B. John" <john.maxin@nokia.com>
In-Reply-To: <4DD67E3A.4090802@nokia.com>
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>
	<4DD65673.8080801@nokia.com> <1305886801.2630.132.camel@localhost>
	<4DD66B11.4070605@nokia.com> <1305893433.2630.142.camel@localhost>
	<4DD67E3A.4090802@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 15:47:14 +0300
Message-ID: <1305895634.2630.144.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-20 at 15:44 +0100, Maxin B. John wrote:
> This patch fixes the possible null dereference of the variable "oinfo"
> Thanks to Coverity for spotting this.
> 
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
