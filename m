Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dHfK-0000mB-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 21:19:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01b401c1b97e$04d09180$f801a8c0@minibm> 
References: <01b401c1b97e$04d09180$f801a8c0@minibm>  <00de01c1b8ac$928d8b40$f801a8c0@minibm> <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal> <17136.1014059667@redhat.com> 
To: "Chung Ming" <min@hello.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "No Flash Chips Recognized." error. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Feb 2002 21:30:25 +0000
Message-ID: <18943.1014154225@redhat.com>
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

min@hello.org said:
> Yes, I have this: 
>       printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n");

It's still printing two random values off the stack instead of the actual 
mfr and id values. Add the actual numbers.

	printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n", mfr, id);

--
dwmw2
