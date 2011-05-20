Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNP5e-0006Fu-B9
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 12:46:03 +0000
Received: by eyh6 with SMTP id 6so1382608eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 05:45:59 -0700 (PDT)
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: maxin <john.maxin@nokia.com>
In-Reply-To: <4DD66B11.4070605@nokia.com>
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>
	<4DD65673.8080801@nokia.com> <1305886801.2630.132.camel@localhost>
	<4DD66B11.4070605@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 15:10:33 +0300
Message-ID: <1305893433.2630.142.camel@localhost>
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

On Fri, 2011-05-20 at 14:22 +0100, maxin wrote:
> This patch fixes the possible null dereference of the variable "oinfo"
> Thanks to Coverity for spotting this.
> 
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>

Also, when I "git am" your patch, the Author's name will be "maxin", is
this what you want?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
