Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELIzr-0008SX-R9
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 07:24:51 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <433D1BA9.9090508@mw-itcon.de>
References: <433D1BA9.9090508@mw-itcon.de>
Content-Type: text/plain
Date: Fri, 30 Sep 2005 15:23:38 +0400
Message-Id: <1128079418.3546.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	Peter Menzebach <pm-mtd@mw-itcon.de>
Subject: Re: [PATCH]jffs2 fix for dataflash + odd erasesizes
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-30 at 13:04 +0200, Peter Menzebach wrote:
> This patch fixes jffs2 for use with atmel dataflash. Now every part of 
> jffs2 should be able to handle erase sizes and wbuf sizes, which are not 
> 2^X.
> 
> The patch has some trivial changes, where erase sizes were relying on a 
> size of 2^X. The rest of the changes in wbuf.c does affect only 
> dataflash handling.
> 
> http://www.mw-itcon.de/patches/patch.jffs2.dataflash
Looks OK.

Andrew, do you have any comments?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
