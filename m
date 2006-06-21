Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft1Pq-0005T5-Vo
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 08:02:58 -0400
Message-ID: <4499357C.3000901@ru.mvista.com>
Date: Wed, 21 Jun 2006 16:03:08 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH] NAND: fix nand_write_oob_std return value
References: <fe810cf0606210436w7196e009o82ac67a86e41ee9c@mail.gmail.com>
In-Reply-To: <fe810cf0606210436w7196e009o82ac67a86e41ee9c@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander, Thomas,

Alexander Belyakov wrote:
> It seems nand_write_oob_std should not return just status value
>   
can't help myself noticing that that fix already was in my last patch 
sent to Thomas (I think however that I didn't CC the list). :-)

Vitaly
