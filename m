From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20050224111125.GH8651@stusta.de>
References: <20050224111125.GH8651@stusta.de>
Content-Type: text/plain
Date: Thu, 24 Feb 2005 13:20:32 +0000
Message-Id: <1109251232.5420.55.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Eric W. Biederman" <ebiederman@lnxi.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] remove drivers/mtd/maps/ich2rom.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-02-24 at 12:11 +0100, Adrian Bunk wrote:
> drivers/mtd/maps/ich2rom.c is completely unused because it was renamed 
> to drivers/mtd/maps/ichxrom.c .
> 
> This patch removes the stale ich2rom.c file.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

ack.

-- 
dwmw2
