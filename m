Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6mD8-0005l2-Bq
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 04:01:35 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Kevin Liao <kevinliao@wellsyn.com>
In-Reply-To: <01e801c51fcc$ae93fa10$1b0a060a@WellSyn.org>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
	<1109838505.5398.3.camel@tglx.tec.linutronix.de>
	<01e801c51fcc$ae93fa10$1b0a060a@WellSyn.org>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 10:01:27 +0100
Message-Id: <1109840487.5398.16.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: compile error (undefined reference to jffs2_getlink) forkernel
	2.4.26
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 16:40 +0800, Kevin Liao wrote:
> Thanks for the reply. Actully I had read it before I ask this question.
> According to the webpage, the kernel version I used should be ok.
> I think the root cause is not the kernel version. Because I serach
> the whole directory extracted from snapshop 20050302 but found
> no implementation for jffs2_getlink function. Maybe I search the
> wrong place?

Yes, jffs2_getlink is removed. There was an update to jffs2 a couple of
days ago. It broke the 2.4 code.

Frankly spoken, I personally don't care.

2.4 is as is and we are not going to do anything about. Feel free to fix
it by porting the link changes back to super-v24.c or use an snapshot
before said changes.

tglx
