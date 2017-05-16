Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAh7t-0000Bt-5y
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 18:23:19 +0000
Subject: Re: [RESEND PATCH v3] UBI: add debugfs file for tracking PEB state
To: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org
References: <1494957488-31427-1-git-send-email-zach.brown@ni.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56b1f2d2-d368-895b-d3fc-0edd729e5863@nod.at>
Date: Tue, 16 May 2017 20:22:52 +0200
MIME-Version: 1.0
In-Reply-To: <1494957488-31427-1-git-send-email-zach.brown@ni.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zach,

Am 16.05.2017 um 19:58 schrieb Zach Brown:
> From: Ben Shelton <ben.shelton@ni.com>
> 
> Add a file under debugfs to allow easy access to the erase count for
> each physical erase block on an UBI device.  This is useful when
> debugging data integrity issues with UBIFS on NAND flash devices.
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>

Hmmm, I thought I applied this to my v4.12 queue, but seems
like I didn't. So, it will be part of v4.13.
I'm very sorry, please accept my apologies.

Thanks,
//richard
