Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7TwX-0007qP-E2
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 05:20:17 -0400
Message-ID: <44CDCB1F.3050005@yandex.ru>
Date: Mon, 31 Jul 2006 13:19:27 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Marteo Tim <tim.marteo@gmail.com>
Subject: Re: about using UBI on MLC Nand flash
References: <91b24a870607272033n1fa43a45vb523982186708f8e@mail.gmail.com>	
	<44C9BA59.7030006@yandex.ru>
	<91b24a870607310205w7fa0d847wb652da7a1b0c52c7@mail.gmail.com>
In-Reply-To: <91b24a870607310205w7fa0d847wb652da7a1b0c52c7@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Marteo Tim wrote:
> OK, I'm glad to send it to you, include SAMSUNG&TOSHIBA's MLC NAND
> flash datasheet, please check your email, :)
Thanks!

> Due to cheap price, MLC NAND flash maybe use more and more popular,
> especially in bulky flash. Yaffs2 can already support MLC chips by
> zero page rewrites, and I want UBI can support it too. :)

Well, UBI works in this case as well. But it anyway needs 2 write 
operations. So, in your case, we'll spend 4K for UBI headers in each 
eraseblock... It's wastful, agree, but may be appropriate in some 
applications.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
