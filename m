Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBeY2-00041J-Lb
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2005 14:51:19 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: dedekind@infradead.org
In-Reply-To: <1110974906.30606.38.camel@sauron.oktetlabs.ru>
References: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
	<1110974906.30606.38.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 16 Mar 2005 20:51:16 +0100
Message-Id: <1111002676.4814.112.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Sergei Sharonov <Sergei.Sharonov@Halliburton.com>
Subject: Re: failed write verify causes segmentation fault
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-03-16 at 15:08 +0300, Artem B. Bityuckiy wrote:
> This is only one possible reason. The other possible reason which I
> think is more likely has happened in your case is that JFFS2 tried to
> write to a non-empty NAND page, e.g., the page didn't contain all 0xFF.
> In this case write_verify() might fail as well. I don't know why JFFS2
> might do that, possibly there is some bug.

The question is not why the write verify fails. In his test environment
a page failure is expected to happen at some point. The question is why
JFFS2 did not cope with the problem as it is supposed to be.

tglx
