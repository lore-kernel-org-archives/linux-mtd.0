Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zygjq-0000t2-FB
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 13:56:03 +0000
Subject: Re: [PATCH 2/3] mtd: m25p80: replace leftover "nor-jedec" with
 "spi-nor" in comments
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
 <1447713292-91525-3-git-send-email-computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <564B31DA.1030502@osg.samsung.com>
Date: Tue, 17 Nov 2015 10:55:38 -0300
MIME-Version: 1.0
In-Reply-To: <1447713292-91525-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

On 11/16/2015 07:34 PM, Brian Norris wrote:
> I overlooked a few comments in commit 8947e396a829 ("Documentation: dt:
> mtd: replace "nor-jedec" binding with "jedec, spi-nor""). Fix these up
> now.
> 
> Suggested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
