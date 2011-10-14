Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdH0-0000g1-4K
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:37:46 +0000
Received: by wwg9 with SMTP id 9so537552wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 01:37:44 -0700 (PDT)
Subject: Re: [PATCH] mtd: m25p80: add EON flash EN25Q32B into spi flash id
	table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shaohui Xie <Shaohui.Xie@freescale.com>
Date: Fri, 14 Oct 2011 11:37:14 +0300
In-Reply-To: <1317366518-11403-1-git-send-email-Shaohui.Xie@freescale.com>
References: <1317366518-11403-1-git-send-email-Shaohui.Xie@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318581441.12351.65.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Kumar Gala <galak@kernel.crashing.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-30 at 15:08 +0800, Shaohui Xie wrote:
> Add support for EON spi flash EN25Q32B, which is not listed in id table,
> need to add it in the id table to support the EON flash.
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie@freescale.com>
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
