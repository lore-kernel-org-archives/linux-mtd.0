Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTdmh-0004JP-SC
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 05:08:37 -0500
Message-ID: <41987FFE.1050302@oktetlabs.ru>
Date: Mon, 15 Nov 2004 13:07:58 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41986D89.4060308@oktetlabs.ru>	
	<1100508552.8015.61.camel@localhost.localdomain>	
	<1100510529.5074.119.camel@thomas> <41987A4F.6090400@oktetlabs.ru>
	<1100512632.5074.123.camel@thomas>
In-Reply-To: <1100512632.5074.123.camel@thomas>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: NAND pages cache?
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> The nand driver always reads whole pages due to ECC. But if the fs
> driver requests only a part of the page then the page is read into the
> cache buffer of the nand driver, ECC is checked and the part which was
> requested by the fs driver is copied into the fs buffer. If the next
> read requests another part of this page then we read out of the cache
> buffer instead of reading the FLASH again.
> 
> tglx
O, thank you for the hint!

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
