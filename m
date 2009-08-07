Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MZPSk-00054w-Re
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 13:26:31 +0000
Message-ID: <4A7C2B79.6060308@linutronix.de>
Date: Fri, 07 Aug 2009 15:26:17 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: ashishpareek <bless2ashish@rediffmail.com>
Subject: Re: Nand partition > 2Gb issue
References: <1249643953.S.5973.39700.f5mail-147-128.rediffmail.com.1249644127.19245@webmail.rediffmail.com>
In-Reply-To: <1249643953.S.5973.39700.f5mail-147-128.rediffmail.com.1249644127.19245@webmail.rediffmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ashishpareek wrote:
> 
> 
> On Fri, 07 Aug 2009 16:49:13 +0530 wrote
>  >Hi,
>  >
>  >I am using 2.6.18 Kernel and i want to know what changes i need to do to
>  
>  >have 2GB partition (blocks >8192) solved.Could any one help me?

linux-mtd ist the correct list to ask.

2 GiB should work I think. Adrian Hunter posted patches for >=4 GiB called
"MTD: update internal API to support 64-bit device size".

>  >
>  >Ashish

Sebastian
