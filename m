Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ct4D-0007cP-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 19:03:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00de01c1b8ac$928d8b40$f801a8c0@minibm> 
References: <00de01c1b8ac$928d8b40$f801a8c0@minibm>  <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal> 
To: "Chung Ming" <min@hello.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "No Flash Chips Recognized." error. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Feb 2002 19:14:27 +0000
Message-ID: <17136.1014059667@redhat.com>
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

+ printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n");

Oops. Try it with the numbers in :)

--
dwmw2
