Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdKWN-0002ax-Ig
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 09:30:44 +0000
Received: by fg-out-1718.google.com with SMTP id e12so152243fga.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Feb 2010 01:30:37 -0800 (PST)
Subject: Re: [PATCH 13/17] MTD: export few functions from nand_base.c
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: "stanley.miao" <stanley.miao@windriver.com>
In-Reply-To: <4B6B8338.5060608@windriver.com>
References: <1265326257-4446-1-git-send-email-maximlevitsky@gmail.com>
	<1265326257-4446-14-git-send-email-maximlevitsky@gmail.com>
	<4B6B8338.5060608@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Feb 2010 11:30:34 +0200
Message-ID: <1265362234.15383.14.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-05 at 10:32 +0800, stanley.miao wrote: 
> Maxim Levitsky wrote:
> > This exports:
> >
> > nand_do_read_oob
> > nand_do_write_oob
> >   
> 
> nand_do_read_oob and nand_do_write_oob can't be exported. They are internal
> functions in NAND subsystem. If you want use them, please use mtd->read_oob
> and mtd->write_oob.

I would be happy to use these, and I tried to do so.
However this leads to deadlock, because ->block_bad can (and is) called
with controller lock (nand_get_device), thus if I call ->read_oob I will
get deadlock.

Best regards,
Maxim Levitsky
