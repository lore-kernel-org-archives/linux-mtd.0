Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vOOp-0001JH-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 20:04:28 +0100
To: <linux-mtd@lists.infradead.org>
Subject: Q: interleave logic?
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 03 May 2001 13:04:49 -0600
Message-ID: <m38zketfse.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

What do we have nasty half incomplete interleave
logic all throughout the cfi code?

It looks like it could be done more cleanly with a wrapper
around the probe code, and a wrapper around the mapping driver.

Eric
