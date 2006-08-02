Received: from host46-203-static.38-85-b.business.telecomitalia.it
	([85.38.203.46] helo=dave-tech.it)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8IT4-0008Ta-OF
	for linux-mtd@lists.infradead.org; Wed, 02 Aug 2006 11:17:11 -0400
Message-ID: <44D0C250.2030601@dave-tech.it>
Date: Wed, 02 Aug 2006 17:18:40 +0200
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: How to generate a patch limited to MTD subsystem
References: <44D0B33A.2080702@dave-tech.it> <44D0B8FF.6090601@yandex.ru>
In-Reply-To: <44D0B8FF.6090601@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'd do like this:
> 
> rm -rf linux-2.6.15/drivers/mtd
> cp -r linux-latest/drivers/mtd linux-2.6.15/drivers/
> 
> rm linux-2.6.15/include/mtd
> cp -r linux-latest/include/mtd linux-2.6.15/include/mtd
> 
> rm linux-2.6.15/include/linux/mtd
> cp -r linux-latest/include/linux/mtd linux-2.6.15/include/linux/mtd
> 
> Then try to compile & run and resolve all problems. I suspect there are 
> not going to be many of them.
> 

Hmm ... if I recall correctly MTD provides more stuff (JFFS2 for 
example), doesn't it?

-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
