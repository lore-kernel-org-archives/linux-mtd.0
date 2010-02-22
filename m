Date: Mon, 22 Feb 2010 22:20:58 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 10/15] MTD: nand: make reads using MTD_OOB_RAW affect
	only ECC validation
In-Reply-To: <1266863982-5258-11-git-send-email-maximlevitsky@gmail.com>
Message-ID: <alpine.LFD.2.00.1002222219430.4136@localhost.localdomain>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
	<1266863982-5258-11-git-send-email-maximlevitsky@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 22 Feb 2010, Maxim Levitsky wrote:

> This changes the behavier of MTD_OOB_RAW. It used to read both OOB and data
> to the data buffer, however you would still need to specify the dummy oob buffer.
> 
> This is only used in one place, but makes it hard to read data+oob without ECC
> test, thus I removed that behavier, and fixed the user.
> 
> Now MTD_OOB_RAW behaves just like MTD_OOB_PLACE, but doesn't do ECC validation

Is this tested against existing user space tools like nanddump ? Can I
still get the raw data from flash ?

Thanks,

	tglx
 
