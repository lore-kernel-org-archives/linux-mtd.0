Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBZbC-0003aw-DS
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 14:29:42 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i38CfTj9019992
	for <linux-mtd@lists.infradead.org>; Thu, 8 Apr 2004 14:41:29 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id PAA29916
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Apr 2004 15:29:33 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <407553A5.5010702@imc-berlin.de>
Date: Thu, 08 Apr 2004 15:29:09 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <40742192.5030901@imc-berlin.de>
	<1081354787.4799.191.camel@tubarao>
In-Reply-To: <1081354787.4799.191.camel@tubarao>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thayne Harbaugh wrote:

> On Wed, 2004-04-07 at 09:43, Steven Scholz wrote:
> 
>>Hi there,
>>
>>on my embedded PPC system with linux-2.425 I have two flash devices.
> 
> 
>>Warning: DQ5 raised while program operation was in progress, however operation completed OK
>>Warning: DQ5 raised while program operation was in progress, however operation completed OK
>>Warning: DQ5 raised while program operation was in progress, however operation completed OK
>>Waiting for write to complete timed out in do_write_oneword.
> 
> 
> These error messages are from an ancient version of cfi_cmdset_0002.c.
> They come from over-efficient software design that didn't consider the
> quirks of how a flash chip works. Have you tried a recent version?

I just notice that in my old 2.4.20 kernel tree I have a

	* $Id: cfi_cmdset_0002.c,v 1.67 2003/04/15 22:32:13 thayne Exp $

and in a _new_ 2.4.25 tree I have

	 * $Id: cfi_cmdset_0002.c,v 1.62 2003/01/24 23:30:13 dwmw2 Exp $

How could that be !?!?

Is the MTD code not pushed up into the main kernel sources???

Steven



-- 
Steven Scholz

imc Measurement & Control               imc Meﬂsysteme GmbH
Voltastr. 5                             Voltastr. 5
13355 Berlin                            13355 Berlin
Germany                                 Deutschland
