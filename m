Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu4a2-0003wr-OT
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 20:22:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/6] mtd: pxa3xx_nand: Increase the initial chunk size
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Wed, 04 Nov 2015 21:15:39 +0100
In-Reply-To: <1446653626-14802-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Wed, 4 Nov 2015 13:13:41 -0300")
Message-ID: <87h9l1bjx0.fsf@belgarion.home>
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

> The chunk size represents the size of the data chunks, which
> is used by the controllers that allow to split transfered data.
>
> However, the initial chunk size is used in a non-splitted way,
> during device identification. Therefore, it must be large enough
> for all the NAND commands issued during device identification.
> This includes NAND_CMD_PARAM which was recently changed to
> transfer up to 2048 bytes (for the redundant parameter pages).
>
> Thus, the initial chunk size should be 2048 as well.
Ok.

Does anybody own an "512 bytes per page" chip to see if there is any regression
with this ? My own are 2048 ones, so I cannot test it myself.

Apart from that :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
