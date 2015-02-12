Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLwbF-0004f8-FR
 for linux-mtd@lists.infradead.org; Thu, 12 Feb 2015 16:26:46 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 5/9] mtd: pxa3xx_nand: add support for the Marvell Berlin
 nand controller
References: <1422367816-4257-1-git-send-email-antoine.tenart@free-electrons.com>
 <1422367816-4257-6-git-send-email-antoine.tenart@free-electrons.com>
 <20150209005503.3fad39c7@bbrezillon> <871tlx7dgu.fsf@free.fr>
 <20150211163343.GH11169@kwain>
Date: Thu, 12 Feb 2015 17:26:20 +0100
In-Reply-To: <20150211163343.GH11169@kwain> (Antoine Tenart's message of "Wed,
 11 Feb 2015 17:33:43 +0100")
Message-ID: <87k2zn5c5v.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: thomas.petazzoni@free-electrons.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Antoine Tenart <antoine.tenart@free-electrons.com> writes:

>> All these ifs per variant will add complexity to the current driver, won't they
>> ?
>
> Given the current state of this driver I believe this would be a better
> idea to first rework it to use the nand framework properly. Then it will
> be possible to have a look on what we have, to decide whether or not a
> mrvl-nand-lib is needed.

I don't fully agree to delay.
You're taking code, making sometimes copy-paste, for the berlin specific
functions, and I think you're taking the bugs as well, which duplicates the fix
effort.

For example, in nand_cmdfunc_berlin():
+	if (info->reg_ndcr & NDCR_DWIDTH_M)
+		column /= 2;

This is I think a copy-paste from its twin nand_cmdfunc(). Now consider what
happens if the command is _not_ a read command, but an ONFI READID command
(ONFI being specified by column=0x20 if memory serves me well).

This is the reason I don't really like this patch. And this is also the reason
why I believe you're in a perfect timing to improve things, by grouping the
common function, and keeping the bugs in only one place, not many.

Cheers.

-- 
Robert
