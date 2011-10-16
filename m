Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFPGP-0000Sq-TR
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 11:52:22 +0000
Received: by bkbc12 with SMTP id c12so6483896bkb.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 04:52:19 -0700 (PDT)
Subject: Re: [PATCH] mtd: m25p80: don't probe device which has status of
	'disabled'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shaohui Xie <Shaohui.Xie@freescale.com>
Date: Sun, 16 Oct 2011 14:51:54 +0300
In-Reply-To: <1318578540-12872-1-git-send-email-Shaohui.Xie@freescale.com>
References: <1318578540-12872-1-git-send-email-Shaohui.Xie@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318765920.2935.9.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, galak@kernel.crashing.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-10-14 at 15:49 +0800, Shaohui Xie wrote:
> On some platforms such as P3060QDS, has multiple spi flashes, but they are
> not available at same time, so if their status is 'disabled', which is set
> by u-boot, will not be probed.
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie@freescale.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
