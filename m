Subject: Re: [PATCH] Allow variable block sizes in mtd_blkdevs
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1161936573.5019.55.camel@localhost.localdomain>
References: <1161936573.5019.55.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 27 Oct 2006 16:22:34 +0300
Message-Id: <1161955354.7638.55.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-10-27 at 09:09 +0100, Richard Purdie wrote:
> Currently, mtd_blkdevs enforces a block size of 512, even if the drivers
> can seemingly request a different size. This patch fixes mtd_blkdevs so
> block sizes other than 512 work correctly. 

Could/did you test this with FTL on mtdram?

-- 
dwmw2
