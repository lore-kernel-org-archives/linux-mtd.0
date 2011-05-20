Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNQAa-0007jW-IN
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 13:55:13 +0000
Received: by bwz1 with SMTP id 1so3696888bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 06:55:10 -0700 (PDT)
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Maxin B. John" <john.maxin@nokia.com>
In-Reply-To: <4DD67E3A.4090802@nokia.com>
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>
	<4DD65673.8080801@nokia.com> <1305886801.2630.132.camel@localhost>
	<4DD66B11.4070605@nokia.com> <1305893433.2630.142.camel@localhost>
	<4DD67E3A.4090802@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 16:51:19 +0300
Message-ID: <1305899479.2630.147.camel@localhost>
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

Pushed to l2-mtd-2.6.git, thanks!


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
