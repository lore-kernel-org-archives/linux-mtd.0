Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VXE2-0007uX-Nr
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 14:55:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Yy Yy <yy_hust@yahoo.com.cn>
In-Reply-To: <20030626133856.50391.qmail@web15312.mail.bjs.yahoo.com>
References: <20030626133856.50391.qmail@web15312.mail.bjs.yahoo.com>
Message-Id: <1056635767.27553.177.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 26 Jun 2003 14:56:07 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Thu, 2003-06-26 at 14:38, Yy Yy wrote:
> Could you please tell me why the data integrity will
> be destroyed if I write/read the device file?

The mtdblock 'translation layer' is not safe. This has been explained in
various mailing lists on many occasions. Ask Google.

> Do you mean I should add the read/write request to the
> request_queue of blkdevs[MAJOR_NR], and let it handle
> the request by itself.
> Could you please give me more ideas about it.

Not before you have demonstrated that you have read blkmtd.c as I
suggested.

-- 
dwmw2
