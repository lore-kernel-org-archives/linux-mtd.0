Received: from mail145.messagelabs.com ([216.82.242.163])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjMEn-0006Hu-5E
	for linux-mtd@lists.infradead.org; Mon, 16 Mar 2009 23:28:59 +0000
Message-ID: <49BEE0B1.7020507@magtech.com.au>
Date: Tue, 17 Mar 2009 10:28:49 +1100
From: Aras Vaichas <arasv@magtech.com.au>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [patch 4/9] jffs2: force the jffs2 GC daemon to behave a bit
	better
References: <200902112127.n1BLR2HX031153@imap1.linux-foundation.org>
	<Pine.LNX.4.64.0902121016250.19761@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0902121016250.19761@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dilinger@debian.org" <dilinger@debian.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dilinger@queued.net" <dilinger@queued.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> On Wed, 11 Feb 2009, akpm@linux-foundation.org wrote:
>
>   
>> I've noticed some pretty poor behavior on OLPC machines after bootup, when
>> gdm/X are starting.  The GCD monopolizes the scheduler (which in turns
>> means it gets to do more nand i/o), which results in processes taking much
>> much longer than they should to start.
>>     
>
> Can't really comment on how well the patch works, but we've also noticed a 
> similar slowdown on our systems during startup, so the idea as such is 
> welcome at any rate.
>   
I just posted a message to linux-arm-kernel regarding a similar problem 
I have an at91rm9200 based machine with NAND and JFFS2.

I suspected that garbage collection was causing delays of up to 3+ 
seconds during which time my watchdog patting daemon was not being 
scheduled ...

This was causing the watchdog timer to reset my machine but *only* when 
it was under significant NAND load  i.e. boot time, loading up the main 
application while GCD was running.

My solution was to double the watchdog timeout.

Aras

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
