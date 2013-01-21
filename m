Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TxDCT-000361-Bx
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 08:57:54 +0000
Message-ID: <50FD02EA.5050209@parrot.com>
Date: Mon, 21 Jan 2013 09:57:14 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: question: Why the nand_wait() wait for 20ms for nand program.
References: <50F9023D.5040408@freescale.com> <50F93F65.90805@parrot.com>
 <50FCB75D.1000200@freescale.com>
In-Reply-To: <50FCB75D.1000200@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang Shijie a écrit :
> 于 2013年01月18日 20:26, Matthieu CASTET 写道:
>> Huang Shijie a écrit :
>>> Hi all:
>>> Why the nand_wait() wait for 20ms for nand program. could we
>>> expand this time to 40ms? I have a nand chip : Micron MT29F64G08CBABAWP.
>>> The chip's BUSY/READY pin may needs more then 20ms to become ready,
>>> though its
>>> datasheet tells me the tPROG's max value is 2.5ms.
>>>
>> Don't you have an hardware problem (missing pullup/down on ready busy pin) ?
>>
>> If the datasheet say the max value is 2.5 ms , how it can be more than 20 ms.
> 
> I finally found the root cause.
> 
> I added the do_gettimeofday() in the nand_wait() to measure the 
> READY/BUSY time. The code is like this:
> ---------------------------------------------------- code start 
>
Could you dump jiffies and timeo in your code ?
