Received: from wproxy.gmail.com ([64.233.184.196])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CveiM-0003w2-MX
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 16:47:52 +0000
Received: by wproxy.gmail.com with SMTP id 68so657763wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jan 2005 08:46:46 -0800 (PST)
Message-ID: <6934efce05013108463a4d42e4@mail.gmail.com>
Date: Mon, 31 Jan 2005 08:46:46 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1107111514.18794.37.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
	<1106873065.21196.168.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
	<1106903029.21196.216.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280914580.11160@phoenix.infradead.org>
	<Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
	<1107111514.18794.37.camel@sauron.oktetlabs.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 1. For each inode we keep in-core the list of block numbers, where this
> inode's nodes are present. Thus, to build the inode's nodes track, we
> need to read only these summary nodes.
> 
> 2. Use ICPs.


I'm not sure I understand the difference.  In case 1) are you
suggesting keeping the ICP like data in the summary nodes?

I think the ICP's are a great idea.
