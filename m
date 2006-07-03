Received: from www.tglx.de ([213.239.205.147] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FxNIH-0005nk-RZ
	for linux-mtd@lists.infradead.org; Mon, 03 Jul 2006 08:13:02 -0400
Subject: Re: 2k page Nand flash problem
From: Thomas Gleixner <tglx@linutronix.de>
To: girish@picopeta.com
In-Reply-To: <44A8FE6A.4040002@picopeta.com>
References: <44A4D796.4070107@picopeta.com>  <44A8FE6A.4040002@picopeta.com>
Content-Type: text/plain
Date: Mon, 03 Jul 2006 14:15:12 +0200
Message-Id: <1151928912.24611.49.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-07-03 at 16:54 +0530, Girish wrote:
>   hi ,
> Sorry i forgot to mention that i am using NAND_ECC_SOFT option and 
> chip_delay = 25us.
> Thanks & regards
> Girish

Can you please try to reproduce with latest MTD git ?

	tglx
