Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTtjz-0003sr-W4
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:05:48 +0000
Received: by fxm22 with SMTP id 22so23089420fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 01:05:43 -0800 (PST)
Subject: Re: what's with CONFIG_MTD_PISMO?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
In-Reply-To: <alpine.LFD.2.00.1001030716270.13494@localhost>
References: <alpine.LFD.2.00.1001030716270.13494@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 11:05:40 +0200
Message-Id: <1263114340.7315.135.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-03 at 07:18 -0500, Robert P. J. Day wrote:
> at the moment, there is a Makefile reference to a non-existent
> Kconfig variable:
> 
> ./drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PISMO)    += pismo.o
> 
>   but there is no definition of Kconfig variable MTD_PISMO.  should
> this be defined in a Kconfig file somewhere?

Yeah, the driver and Kconfig part were forgotten somehow. They are
simply absent.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
