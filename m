Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu5Dp-0006iY-82
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 21:03:58 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/6] nand: pxa3xx: Simplify pxa3xx_nand_scan
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Wed, 04 Nov 2015 21:56:48 +0100
In-Reply-To: <1446653626-14802-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Wed, 4 Nov 2015 13:13:43 -0300")
Message-ID: <87d1vpbi0f.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> This commit simplifies the initial configuration performed
> by pxa3xx_nand_scan. No functionality change is intended.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Yes, I like this one very much.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
