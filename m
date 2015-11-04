Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu5MF-0003Dr-GV
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 21:12:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/6] mtd: pxa3xx_nand: Remove redundant NAND sensing
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Wed, 04 Nov 2015 22:05:30 +0100
In-Reply-To: <1446653626-14802-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Wed, 4 Nov 2015 13:13:44 -0300")
Message-ID: <878u6dbhlx.fsf@belgarion.home>
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

> Currently, the driver is trying to detect the presence of a chip
> by issuing a RESET command before nand_scan_ident. This seems completely
> redundant, and is also a layering violation as nand_scan_ident is in charge
> of device detection.
>
> This commit removes the RESET command use, and moves the initial
> timing configuration to pxa3xx_nand_config_ident.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
That one looks good to me. I have not taken the time to apply it to see the
overall change, but from a first sight it's ok.

Cheers.

--
Robert
