Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G8eRR-0006Bv-7T
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 10:45:02 -0400
Subject: Re: Problem with mounting JFFS2
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Iva Salom <diva@kondor.imp.bg.ac.yu>
In-Reply-To: <001601c6b6ea$cb60f790$c6345b93@VLADIMIR>
References: <001601c6b6ea$cb60f790$c6345b93@VLADIMIR>
Content-Type: text/plain
Date: Thu, 03 Aug 2006 18:44:15 +0400
Message-Id: <1154616255.9457.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Iva,

On Thu, 2006-08-03 at 12:51 +0200, Iva Salom wrote:
> I am a beginner in all these embedded linux - mtd - jffs stuff. I am
> using Intel FLASH 28F320 (2 interleaved 16b chips of 8MB, so we have
> 32bit buswidth) (CFI) with TMS320C5471 platform. I turnd on MTD
> support, so I have 5 partitions: bootloader (/dev/mtd0), bootloader
> parameters (/dev/mtd1), kernel image (/dev/mtd2), ROMFS SDRAM image
> (/dev/mtd5), primary file system, which is romfs (/dev/mtd3) and I
> want the second to be jffs2 (/dev/mtd4):

Sorry, I didn't get it what's the question/problem. The output you
provided looks OK. If you don't want all this output - just disable
JFFS2 debugging. Or you deliberately enabled it?

BTW, your original message included HTML and was not rejected by a
mistake. Please, don't send HTML messages.

Regards,
Artem.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
