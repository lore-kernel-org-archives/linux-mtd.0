Received: from huva.hittite.isp.9tel.net ([62.62.156.28])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al9m0-0001hV-5U
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 16:39:40 +0000
Received: from jennifer (14.170.62.62.internet9t.9massy1-1-ro-bas-2.9tel.net
	[62.62.170.14])
	by huva.hittite.isp.9tel.net (Postfix) with ESMTP id 63AAD9BF48
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jan 2004 17:39:19 +0100 (CET)
From: "Philippe" <philippe@accuitee.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 26 Jan 2004 17:39:41 +0100
Message-ID: <000501c3e42a$ff0123d0$247dfea9@jennifer>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1075133878.27507.15.camel@hades.cambridge.redhat.com>
Subject: RE : RE : DOC2k booting speed ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> Perhaps you could use a read-only file system on the DiskOnChip, and use
> a ramfs for those areas of the file system which you need to be
> writable?

Well I had some troubles with the /etc/mtab....

> 
> If you mount a ramfs on /mnt/ramfs, you can make symlinks into it from
> the 'real' file system.

I'll try to see if I can do something with tmpfs/ramfs...

Thank you

> 
> --
> dwmw2
