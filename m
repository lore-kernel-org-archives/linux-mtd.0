Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by pentafluge.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GNWG2-0004Bp-QQ
	for linux-mtd@lists.infradead.org; Wed, 13 Sep 2006 16:02:35 +0100
Message-ID: <45081D55.9090508@ru.mvista.com>
Date: Wed, 13 Sep 2006 19:01:41 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] fix small nand_base errors
References: <20060710145637.03433875.vwool@ru.mvista.com>
In-Reply-To: <20060710145637.03433875.vwool@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

Vitaly Wool wrote:
> Hi Thomas,
>
> please find the patch that fixes small nand_base errors inlined.
> Brief explanation: for nand_write_oob_syndrome, you should first set the position to eccsize, as OOB starts past the eccsize, not eccsize + chunk.
> For nand_fill_oob I guess that's just a typo, otherwise it just doesn't make sense (and OTOH makes this routine write to 0-th OOB byte thus actually marking it as bad).
>   
Can't see this patch applied, which makes NAND base fail for me.

Vitaly
