Received: from [217.110.46.186] (helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q8Kq-0005VL-DK
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:20:28 +0100
Message-ID: <3EE756EA.6040001@imc-berlin.de>
Date: Wed, 11 Jun 2003 18:20:58 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3EE752EE.8090902@imc-berlin.de>
	<1055347637.2097.240.camel@passion.cambridge.redhat.com>
	<3EE754E4.7080800@imc-berlin.de>
	<1055348281.2097.245.camel@passion.cambridge.redhat.com>
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
> On Wed, 2003-06-11 at 17:12, Steven Scholz wrote:
> 
>>(How) Could I trigger the GC thread to test its impact on my 
>>application or the overall system performance?
>>Is there a signal I could sent to start a GC?
> 
> 
> No. You used to be able to trigger it by repeatedly sending it SIGHUP
> but that doesn't work any more. I keep intending to make the thresholds
> tunable in /proc though, which you could abuse to do what you want.
> 

So for now I just could hardcode the thresholds (ehm which BTW?) to 
some low value, recompile and test?

Steven
