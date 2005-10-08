Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOEfB-0000IT-7r
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2005 09:23:12 -0400
Message-ID: <4347C82A.3060209@ru.mvista.com>
Date: Sat, 08 Oct 2005 17:22:50 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>	
	<43479777.5060309@ru.mvista.com>
	<1128765885.1728.82.camel@tglx.tec.linutronix.de>
In-Reply-To: <1128765885.1728.82.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nreddy@netenrich.com, linux-mtd@lists.infradead.org
Subject: Re: "Timing issue when we use SPANSION 8MB Flash"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Sat, 2005-10-08 at 13:55 +0400, Vitaly Wool wrote:
>  
>
>>Hi,
>>
>>am I right that it's a NOR flash? What's the reason for using JFFS2 on 
>>it then?
>>    
>>
>
>Err, why shouldnt he use JFFS2 on NOR ? Is there a better suited file
>system which can handle NOR FLASH?
>
>tglx
>
>  
>
cramfs ;)
