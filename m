Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GB6oT-0007pC-O9
	for linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 05:26:57 -0400
Message-ID: <44DAFB9B.1040902@yandex.ru>
Date: Thu, 10 Aug 2006 13:25:47 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: KimM <kmnet1@gmail.com>
Subject: Re: Dynamic MTD partition tables in Linux
References: <pan.2006.08.10.08.12.54.851351@gmail.com>
In-Reply-To: <pan.2006.08.10.08.12.54.851351@gmail.com>
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

Hello KimM,

KimM wrote:
> I need support for dynamic MTD partition tables in Linux. Currently there's four
> ways of doing this: cmdlineparsing, Redboot, ARM way or my own way. 
> 

Please, pay your attention to UBI:

http://www.linux-mtd.infradead.org/doc/ubi.html
http://www.linux-mtd.infradead.org/faq/ubi.html

This is a new technology, so no barand boot-loaders support it yet. But 
it is completely "dynamic".

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
