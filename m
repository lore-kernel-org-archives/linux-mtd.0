Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueof-0000Rq-1i
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 14:17:58 +0000
Date: Tue, 28 Aug 2018 16:17:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Liu Xiang" <liuxiang_1999@126.com>
Cc: "Liu Xiang" <liu.xiang6@zte.com.cn>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, han.xu@nxp.com,
 marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 richard@nod.at
Subject: Re: [PATCH v2] mtd: spi-nor: fsl-quadspi: fix read error for flash
 size  larger than 16MB
Message-ID: <20180828161735.55cccaa8@bbrezillon>
In-Reply-To: <749634d5.bb6a.16580e444f2.Coremail.liuxiang_1999@126.com>
References: <1535462476-3540-1-git-send-email-liu.xiang6@zte.com.cn>
 <20180828152305.18df57e2@bbrezillon>
 <749634d5.bb6a.16580e444f2.Coremail.liuxiang_1999@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Aug 2018 22:16:08 +0800 (CST)
"Liu Xiang" <liuxiang_1999@126.com> wrote:

> Thanks for your suggestion. Should I send another patch?

Yes please.
