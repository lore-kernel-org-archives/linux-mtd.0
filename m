Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOsti-0003Bx-2y
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 04:20:51 -0400
Message-ID: <434A2452.3090107@arcom.com>
Date: Mon, 10 Oct 2005 09:20:34 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>		<43479777.5060309@ru.mvista.com>	<1128765885.1728.82.camel@tglx.tec.linutronix.de>
	<4347C82A.3060209@ru.mvista.com>
In-Reply-To: <4347C82A.3060209@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: nreddy@netenrich.com, tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: "Timing issue when we use SPANSION 8MB Flash"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:
> Thomas Gleixner wrote:
>> Vitaly Wool wrote:
>>>
>>> am I right that it's a NOR flash? What's the reason for using JFFS2
>>> on it then?
>>
>> Err, why shouldnt he use JFFS2 on NOR ? Is there a better suited file
>> system which can handle NOR FLASH?
>
> cramfs ;)

When you can write to cramfs let me know!

In case you didn't know, JFFS2 (and its predecessor, JFFS) was actually
originally designed for NOR flash -- NAND support was added later.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
