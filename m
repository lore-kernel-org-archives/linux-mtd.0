Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FGWRh-0007Jr-Oo
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 02:17:28 -0500
Message-ID: <440D335F.1090203@yandex.ru>
Date: Tue, 07 Mar 2006 10:16:47 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <43FAEFD6.1090308@inf.u-szeged.hu> <440C7D45.9080406@yandex.ru>
In-Reply-To: <440C7D45.9080406@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A simple JFFS3 GC algorithm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Your proposal is based on a "map" which is basically a per-region table. 
> This is unscalable solution. Do you have any other more scalable 
> proposals? Let's for now consider this as a fall-back solution, OK?

And, BTW, how are you going to build this "map" when you mount the file 
system?


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
