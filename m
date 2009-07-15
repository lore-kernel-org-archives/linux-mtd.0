Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQyyn-0005s9-N4
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 07:32:48 +0000
Message-ID: <4A5D85FB.5090900@gmail.com>
Date: Wed, 15 Jul 2009 10:32:11 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Eric Benard <eric@eukrea.com>
Subject: Re: [PATCH 1/1] Fix 2k pagesize NAND on i.MX27
References: <1247580005-25011-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1247580005-25011-1-git-send-email-eric@eukrea.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Benard wrote:
> This patch allows i.MX27 to support 2k pagesize NAND flash.
> We are using a Micron 1.8V NAND flash : MT29F4G08ABDWP-ET
> Without this patch, all sectors are marked as bad eraseblock.
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>
> Acked-by : Sascha Hauer <s.hauer@pengutronix.de>

The previous version of your patch is sitting in l2-mtd-2.6.git
and waiting for dwmw2 already.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
