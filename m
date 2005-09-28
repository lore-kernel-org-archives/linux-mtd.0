Received: from [12.44.186.158] (helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKesf-0007eo-Rw
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 12:34:13 -0400
Message-ID: <433AC5CC.9060204@mvista.com>
Date: Wed, 28 Sep 2005 09:33:16 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Chen Zhigao <banyan8@yahoo.com.sg>
References: <433A474A.8040502@yahoo.com.sg>
In-Reply-To: <433A474A.8040502@yahoo.com.sg>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling Errors of map_funcs.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chen Zhigao wrote:
> Folks,
> 
> I try to enable support MTD device under MontaVista 3.1 for our Intel 
> IXP425 demo board. 

You need to contact your MontaVista support channel for your problem. 
Those are old file versions of a kernel no longer supported here at 
linux-mtd, and no one here knows how to translate those line numbers to 
some previous version of the source code.  If a supported IXP425 LSP 
cannot compile its supported mtd mapping driver then it's a bug in that 
product.  I can give you a hint that your ixp425.c is apparently older 
than the rest of the mtd code and needs various mods to match the rest 
of the code.


-- 
Todd
