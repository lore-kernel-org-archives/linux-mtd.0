Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaaMR-00028h-KK
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 10:26:24 -0400
Date: Tue, 24 May 2005 16:25:54 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1116942160.6736.201.camel@tglx.tec.linutronix.de>
Message-ID: <Pine.LNX.4.61.0505241621400.9119@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
	<1116942160.6736.201.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH][02/03] nandsim default values in Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I'd prefer to have them available as module parameters, so I can change
> the settings without recompiling on module load.

What if I rewrite nandsim's module parameters for easier setting of the values, 
like erase block size, page size, OOB size, etc. instead of to have the 
developer enter ID bytes, and change a table entry based on the given values? In 
this case, which entry should be changed?

Bye,

   Patrik Kluba
kkk
