Received: from [217.110.46.186] (helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q8CW-0005Hs-JE
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:11:52 +0100
Message-ID: <3EE754E4.7080800@imc-berlin.de>
Date: Wed, 11 Jun 2003 18:12:20 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3EE752EE.8090902@imc-berlin.de>
	<1055347637.2097.240.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
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

Thanks for that!
(How) Could I trigger the GC thread to test its impact on my 
application or the overall system performance?
Is there a signal I could sent to start a GC?

Steven




-- 
mfg Steven Scholz

imc Meﬂsysteme GmbH
Voltastr. 5
13355 Berlin
Germany
fon: +49 30 467090-0
fax: +49 30 4631576
