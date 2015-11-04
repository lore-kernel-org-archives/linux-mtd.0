Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu5Wc-0007nO-E7
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 21:23:23 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/6] mtd: pxa3xx_nand: Gate/ungate the NAND clock in
 suspend/resume paths
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-7-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Wed, 04 Nov 2015 22:16:12 +0100
In-Reply-To: <1446653626-14802-7-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Wed, 4 Nov 2015 13:13:46 -0300")
Message-ID: <87ziyta2jn.fsf@belgarion.home>
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

> The NAND clock can be disabled on suspend and enabled on resume.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Won't registers set by firmware (IPL/SPL) be lost if you cut the clock ? For
example, NDREDEL ? And if so, shouldn't they be saved upon suspend and restored
upon resume ?

Cheers.

--
Robert
