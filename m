Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWXjl-0000aS-T3
	for linux-mtd@lists.infradead.org; Wed, 28 Mar 2007 08:58:51 -0400
Message-ID: <460A6669.8030605@nokia.com>
Date: Wed, 28 Mar 2007 15:58:17 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Adrian Bunk <bunk@stusta.de>
Subject: Re: [-mm patch] drivers/mtd/ubi/: make code static
References: <20070326205706.a750bb35.akpm@linux-foundation.org>
	<20070328121141.GQ16477@stusta.de>
In-Reply-To: <20070328121141.GQ16477@stusta.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Bunk wrote:
> This patch makes needlessly global code static.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Thanks, will be fixed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
