Received: from ug-out-1314.google.com ([66.249.92.172])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GEcE6-0004GL-Vj
	for linux-mtd@lists.infradead.org; Sun, 20 Aug 2006 02:35:48 +0100
Received: by ug-out-1314.google.com with SMTP id u40so1237013ugc
	for <linux-mtd@lists.infradead.org>;
	Sat, 19 Aug 2006 18:34:46 -0700 (PDT)
Message-ID: <625fc13d0608191834r19ce12e5raccbae011d67c25e@mail.gmail.com>
Date: Sat, 19 Aug 2006 20:34:46 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Richard Purdie" <rpurdie@rpsys.net>
Subject: Re: 2.6.18-rc4 jffs2 problems
In-Reply-To: <1155852587.5530.30.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1154976111.17725.8.camel@localhost.localdomain>
	<1155852587.5530.30.camel@localhost.localdomain>
Cc: Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/17/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> Read the return value before we release the nand device otherwise the
> value can become corrupted by another user of chip->ops, ultimately
> resulting in filesystem corruption.
>

We have multiple confirmations that this patch fixes the issue
reported.  I agree it should go in 2.6.18.

Greg, can you add this to your tree?


> Signed-off-by: Richard Purdie <rpurdie@rpsys.net>

Acked-by: Josh Boyer <jwboyer@gmail.com>

josh
