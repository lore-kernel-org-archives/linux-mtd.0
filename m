Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRias-0006Bd-9G
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 16:51:20 +0000
Subject: Re: mtd/ftl: Use kmalloc_array() in build_maps()
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
 <b379ba57-d926-2572-17ec-5bbe166b0e37@users.sourceforge.net>
 <4be87294-5e91-5ced-770f-8630ccab689a@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <e2e1d30e-b81f-d034-b266-37fec409350d@users.sourceforge.net>
Date: Thu, 12 Jan 2017 17:50:36 +0100
MIME-Version: 1.0
In-Reply-To: <4be87294-5e91-5ced-770f-8630ccab689a@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The indentation has been changed and the new one looks wrong...

The source code formatting contained various open issues before already.


> If you want to fix the indentation to make it compliant with the Linux
> coding style, do it on the whole file so every thing is uniform.

Such a development task is too much for me today.


> Reviewing such dummy/automatic patches is a pure waste of time,
> so personally I think we should just ignore them.

How much do you care for the usage of a function like “kmalloc_array”?

Regards,
Markus
