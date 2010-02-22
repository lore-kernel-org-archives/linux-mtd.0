Date: Mon, 22 Feb 2010 22:25:49 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 13/15] MTD: add few workarounds to nand system for
	SmartMedia/xD chips.
In-Reply-To: <1266863982-5258-14-git-send-email-maximlevitsky@gmail.com>
Message-ID: <alpine.LFD.2.00.1002222223090.4136@localhost.localdomain>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
	<1266863982-5258-14-git-send-email-maximlevitsky@gmail.com>
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

> * Add an option NAND_SMARTMEDIA that can be set by nand driver
>  If set, it will cause separate ID table to be used, which includes
>  mask rom devices and new xD cards

Why that option ? We can just extend the existing ids table and be
done. No extra magic needed.
 
Thanks,

	tglx
