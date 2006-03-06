Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FGKJp-0006wP-ML
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2006 13:20:32 -0500
Message-ID: <440C7D45.9080406@yandex.ru>
Date: Mon, 06 Mar 2006 21:19:49 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <43FAEFD6.1090308@inf.u-szeged.hu>
In-Reply-To: <43FAEFD6.1090308@inf.u-szeged.hu>
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

Ferenc Havasi wrote:
> Dear All,
> 
> We have been thinking about JFFS3 and its remaining parts (such us 
> garbage collection), and described a simple idea for it. I don't think 
> it is the best one, but relatively simple, may implemented in the 
> first/prototype version of JFFS3. The document can be downloaded from here:
> 

Hi Ferenc,

Your proposal is based on a "map" which is basically a per-region table. 
This is unscalable solution. Do you have any other more scalable 
proposals? Let's for now consider this as a fall-back solution, OK?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
