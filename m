Received: from [217.110.46.186] (helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QO42-0001dI-5Y
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 10:08:10 +0100
Message-ID: <3EE84317.1090307@imc-berlin.de>
Date: Thu, 12 Jun 2003 11:08:39 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3EE752EE.8090902@imc-berlin.de>
	<1055347637.2097.240.camel@passion.cambridge.redhat.com>
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

David Woodhouse schrieb:
> On Wed, 2003-06-11 at 17:03, Steven Scholz wrote:
> 
>>Is it safe to just do a
>>
>>~ # kill -s SIGSTOP `pidof jffs2_gcd_mtd0`
>>
>>even if my root fs is on this JFFS2 partition?
> 
> 
> Yes.
> 
> 
>>(I just tried it now and it seems to work. But IIRC a while ago my 
>>system hung when I did something like that...)
> 
> 
> It shouldn't. The GC thread remains strictly an optimisation (and
> doesn't exist in the eCos port, etc.)
> 

David,

two more questions please.

1.) What happens if I send multiple SIGSTOPs or SIGCONTs to the 
thread? Does she handle (i.e. ignore) that properly?

2.) What happnens when I send a SIGSTOP in the middle of a running GC?
Will it stop immediately? Or will it take a while?
I suppose that a few more sectors will be examened and written... 
(10ms, 100ms, 1000ms ...???)
Will it then just continue after a SIGCONT? Or will start all over again?

Thanks!

Steven
