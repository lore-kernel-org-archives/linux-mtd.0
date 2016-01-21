Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMGTs-0000kl-S2
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 14:45:02 +0000
Subject: Re: Using a generic upstream driver with a custom NAND controller
To: David Woodhouse <dwmw2@infradead.org>
Cc: Steve deRosier <derosier@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sebastian Frias
 <sf84@laposte.net>, Brian Norris <computersforpeace@gmail.com>
References: <569E8EEA.6060106@free.fr>
 <CALupW3A8Wz72enL3Gqpx0=HdOQW0DqQtfVLUQmF=NeyoySn_aQ@mail.gmail.com>
 <56A0E59F.4090602@free.fr> <1453385533.4639.94.camel@infradead.org>
From: Mason <slash.tmp@free.fr>
Message-ID: <56A0EECE.6050909@free.fr>
Date: Thu, 21 Jan 2016 15:44:30 +0100
MIME-Version: 1.0
In-Reply-To: <1453385533.4639.94.camel@infradead.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21/01/2016 15:12, David Woodhouse wrote:

> Mason wrote:
>
>> Maybe you can help me find convincing arguments why upstreaming
>> is good.
> 
> The rest of your own email is, surely, precisely such an argument?

Indeed :-)

Problem is: I tried that argument, and it fell on deaf ears.
"There's none so deaf as those who will not hear."

> If you attempt to submit the core changes upstream, then either we help
> you find a better way to do things so that those changes *aren't*
> needed, or we merge them so that all you need to do is a minor update
> to the driver itself (as you hoped).

Great idea. I'll send in the diff tomorrow. I hope the code
won't give the maintainers a heart attack...

Regards.
