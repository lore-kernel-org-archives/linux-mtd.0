Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GNnCB-0002Wu-JH
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 10:07:44 +0100
Message-ID: <10185.194.138.39.55.1158224828.squirrel@www.tglx.de>
In-Reply-To: <45081D55.9090508@ru.mvista.com>
References: <20060710145637.03433875.vwool@ru.mvista.com>
	<45081D55.9090508@ru.mvista.com>
Date: Thu, 14 Sep 2006 11:07:08 +0200 (CEST)
Subject: Re: [PATCH] fix small nand_base errors
From: tglx@linutronix.de
To: "Vitaly Wool" <vwool@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Thomas,
>
> Vitaly Wool wrote:
>> Hi Thomas,
>>
>> please find the patch that fixes small nand_base errors inlined.
>> Brief explanation: for nand_write_oob_syndrome, you should first set the
>> position to eccsize, as OOB starts past the eccsize, not eccsize +
>> chunk.
>> For nand_fill_oob I guess that's just a typo, otherwise it just doesn't
>> make sense (and OTOH makes this routine write to 0-th OOB byte thus
>> actually marking it as bad).
>>
> Can't see this patch applied, which makes NAND base fail for me.

Blame dwmw2. It's in my git tree since 2 month

http://git.infradead.org/?p=users/gleixner/mtd-nand-2.6.git;a=commit;h=8b0036eefd7a96f23244b969417684c8627f5ad6

  tglx
