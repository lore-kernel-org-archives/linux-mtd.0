Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIqpN-0000f0-Ld
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2005 12:22:58 -0400
Message-ID: <4252BB42.6010907@yandex.ru>
Date: Tue, 05 Apr 2005 20:22:26 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: William J Beksi <wjbeksi@setabox.com>
References: <424BFC76.8020101@setabox.com>
In-Reply-To: <424BFC76.8020101@setabox.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]  NAND I/O instruction support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



William J Beksi wrote:
> This patch is to implement reading and writing nand flash by I/O 
> instructions. I have only been able to test on the x86 architecture.
> 
> Questions, comments, criticisms are welcome.
Why didn't you use request_region()/release_region() to allocate IO ports?

I wonder, for what do you need this? Shouldn't you redefine 
nand_read_byte() and the like *in your driver* instead.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
