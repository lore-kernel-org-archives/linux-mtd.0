Received: from web15312.mail.bjs.yahoo.com ([202.3.77.187])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VWxU-0007oQ-CA
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 14:38:41 +0100
Message-ID: <20030626133856.50391.qmail@web15312.mail.bjs.yahoo.com>
Date: Thu, 26 Jun 2003 21:38:56 +0800 (CST)
From: =?gb2312?q?Yy=20Yy?= <yy_hust@yahoo.com.cn>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1056606486.26118.2.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Ask a question about mtdblock.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you a lot
> Assuming you're talking about implementing USB mass
> storage
> 'personality' for the USB slave code, surely you
> shouldn't be making it
> at all specific to the mtdblock device? You should
> make it work on _any_
> block device.
> 
That's just what I want to do.

> No. You should do neither of those. And if you want
> any reasonable
> chance of data integrity you shouldn't be using the
> mtdblock device for
> writing at all. You should send read and write
> requests via the block
> device queues -- see blkmtd.c for inspiration.
> 

Could you please tell me why the data integrity will
be destroyed if I write/read the device file?

Do you mean I should add the read/write request to the
request_queue of blkdevs[MAJOR_NR], and let it handle
the request by itself.

Could you please give me more ideas about it.

Thank you!

_________________________________________________________
Do You Yahoo!? 
网恋的诠释：真情还是放纵？
http://cn.rd.yahoo.com/mail_cn/tag/?http://cn.surveys.yahoo.com/netlove
