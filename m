Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGwRa-0003YG-72
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 04:58:31 -0500
Message-ID: <424BC9C6.80800@rac.de>
Date: Thu, 31 Mar 2005 11:58:30 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: m.mikolaiczyk@rac.de
References: <424BBDE3.4000506@rac.de> <424BC76A.7070808@setabox.com>
In-Reply-To: <424BC76A.7070808@setabox.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND connected with address lines based example
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks to all

I'll thought of Williams idea too but was not sure, and try to implement
it asap (next few hours) and give a feedback.
>
> You can write your hardware control function like this:
>
> switch(cmd) {
>     case NAND_CTL_SETCLE: this->IO_ADDR_W = io_base_addr+1; break;
>     case NAND_CTL_CLRCLE: this->IO_ADDR_W = io_base_addr; break;
>     case NAND_CTL_SETALE: this->IO_ADDR_W = io_base_addr+2; break;
>     case NAND_CTL_CLRALE: this->IO_ADDR_W = io_base_addr; break;
> }
>
> Where io_base_addr = A8000000, your base address.
>
> Hope this helps.

Thanks so far.

Marcus
