Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19XTqm-0000pi-3B
	for <linux-mtd@lists.infradead.org>; Tue, 01 Jul 2003 23:43:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Dan Brown <brown@osdsun1.nrl.navy.mil>
In-Reply-To: <1056978369.25574.357.camel@passion.cambridge.redhat.com>
References: <E16Av0k-00087F-00@pentafluge.infradead.org>
	 <004501c17ce9$b6077210$3501a8c0@MONSTROSITY>
	 <1056978369.25574.357.camel@passion.cambridge.redhat.com>
Message-Id: <1057099445.26374.180.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 01 Jul 2003 23:44:05 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: 2nd try: [PATCH] jffs2 on DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've also just committed the other patches required to make the current
JFFS2 work on the DiskOnChip 2000 and Millennium; I haven't done the
Millennium Plus or old Millennium-only drivers.

I really ought to convert the DiskOnChip drivers to use the generic NAND
code.

-- 
dwmw2
