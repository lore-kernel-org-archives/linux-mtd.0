Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7FWO-0007oX-5g
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 22:46:37 +0000
Received: by bwz7 with SMTP id 7so2645500bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 15:46:33 -0700 (PDT)
Subject: Re: [PATCH 2/5] MTD: blktrans: kill the BKL.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20101016051201.GA2992@pengutronix.de>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
	<1287156047-17439-3-git-send-email-maximlevitsky@gmail.com>
	<20101016051201.GA2992@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Oct 2010 00:46:27 +0200
Message-ID: <1287269187.17093.0.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-16 at 07:12 +0200, Wolfram Sang wrote:
> On Fri, Oct 15, 2010 at 05:20:44PM +0200, Maxim Levitsky wrote:
> > It not needed, because I already added locking for all fops
> > methods.
> > 
> > Signed-off-by: Maxim Levitsky
> 
> This SoB got damaged.
> 

Should I resend it?
Signed-of-by: Maxim Levitsky <maximlevitky@gmail.com>

Best regards,
	Maxim Levitsky
