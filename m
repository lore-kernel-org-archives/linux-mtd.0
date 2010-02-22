Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Njfp6-00022v-PP
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 21:28:17 +0000
Received: by fxm6 with SMTP id 6so5275300fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 13:28:11 -0800 (PST)
Subject: Re: [PATCH 10/15] MTD: nand: make reads using MTD_OOB_RAW affect
	only ECC validation
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <alpine.LFD.2.00.1002222219430.4136@localhost.localdomain>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
	<1266863982-5258-11-git-send-email-maximlevitsky@gmail.com>
	<alpine.LFD.2.00.1002222219430.4136@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Feb 2010 23:28:07 +0200
Message-ID: <1266874087.4971.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, Vitaly Wool <vitalywool@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	stanley.miao@windriver.com, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-22 at 22:20 +0100, Thomas Gleixner wrote: 
> On Mon, 22 Feb 2010, Maxim Levitsky wrote:
> 
> > This changes the behavier of MTD_OOB_RAW. It used to read both OOB and data
> > to the data buffer, however you would still need to specify the dummy oob buffer.
> > 
> > This is only used in one place, but makes it hard to read data+oob without ECC
> > test, thus I removed that behavier, and fixed the user.
> > 
> > Now MTD_OOB_RAW behaves just like MTD_OOB_PLACE, but doesn't do ECC validation
> 
> Is this tested against existing user space tools like nanddump ? Can I
> still get the raw data from flash ?

Thats the point.
Userspace doesn't/can't use that mode.
It is not exposed through mtdchar.
Userspace reads the page, and then reads the oob.

It does use MTD_OOB_RAW, but without data buffer, and this path I don't
change.

The only user of this, is the nand itself, when it reads bad block
table.

I confess that I didn't run test that I ported this code correctly.
But I did logically verified many times that the new code works just
like old one.


Best regards,
Maxim Levitsky
