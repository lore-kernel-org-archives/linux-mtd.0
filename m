Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G8Hsn-0007A8-My
	for linux-mtd@lists.infradead.org; Wed, 02 Aug 2006 10:39:49 -0400
Message-ID: <44D0B8FF.6090601@yandex.ru>
Date: Wed, 02 Aug 2006 18:38:55 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: llandre <r&d2@dave-tech.it>
Subject: Re: How to generate a patch limited to MTD subsystem
References: <44D0B33A.2080702@dave-tech.it>
In-Reply-To: <44D0B33A.2080702@dave-tech.it>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

llandre wrote:
> I'm facing the following problem.
> I'm working on custom hardware with kernel 2.6.15. I suspect I need to 
> update the MTD subsystem with latest sources. How to do that without 
> migrating to latest kernel? In other words I need to generate a patch 
> from latest MTD code against MTD code included in v2.6.15 kernel. Is it 
> possible? How?

I'd do like this:

rm -rf linux-2.6.15/drivers/mtd
cp -r linux-latest/drivers/mtd linux-2.6.15/drivers/

rm linux-2.6.15/include/mtd
cp -r linux-latest/include/mtd linux-2.6.15/include/mtd

rm linux-2.6.15/include/linux/mtd
cp -r linux-latest/include/linux/mtd linux-2.6.15/include/linux/mtd

Then try to compile & run and resolve all problems. I suspect there are 
not going to be many of them.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
