Received: from [217.110.46.186] (helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QOUc-0001w5-NN
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 10:35:38 +0100
Message-ID: <3EE8497F.30402@imc-berlin.de>
Date: Thu, 12 Jun 2003 11:35:59 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3EE752EE.8090902@imc-berlin.de>
	<1055347637.2097.240.camel@passion.cambridge.redhat.com>
	<3EE84317.1090307@imc-berlin.de>
	<1055409538.2097.438.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Stopping the GC thread?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

>>2.) What happnens when I send a SIGSTOP in the middle of a running GC?
>>Will it stop immediately? Or will it take a while?
> 
> 
> It'll finish copying the node it's _currently_ garbage-collecting, which
> may involve decompressing up to a page of data, recompressing it and
> writing it out elsewhere. It may also need to wait for erases to
> complete.
> 
> Even after it's stopped, if there are erasable blocks on the queue,
> they'll continue to be erased in the background by kupdated. You cannot
> prevent that.

But the impact on system performance done by kupdated is not as 
critical as the one that's done by the GC intself, is it?

> 
>>I suppose that a few more sectors will be examened and written... 
>>(10ms, 100ms, 1000ms ...???)
> 
> 
> 'sector'?  Read http://sources.redhat.com/jffs2/jffs2.pdf 
I meant flash sectors.

Steven
