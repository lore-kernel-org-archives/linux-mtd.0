Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13o9Eo-00013u-00
	for mtd-list@infradead.org; Tue, 24 Oct 2000 19:55:54 +0100
Received: from ltc.ltc.com ([38.149.17.171] helo=ltc.com)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13o9Ek-00013o-00
	for mtd@infradead.org; Tue, 24 Oct 2000 19:55:53 +0100
Received: from gw1.ltc.com (gw1.ltc.com [38.149.17.163]) by ltc.com (NTMail 3.03.0017/1.afdd) with ESMTP id ra314487 for <mtd@infradead.org>; Tue, 24 Oct 2000 15:01:52 -0400
Message-ID: <013301c03dec$5082f5f0$0701010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
To: "Steven J. Hill" <sjhill@cotw.com>
Cc: <mtd@infradead.org>
References: <E13nksk-0002RR-00@infradead.org> <18079.972375290@redhat.com> <39F5767A.48E1A44C@cotw.com> <00c101c03dd7$1775e840$0701010a@ltc.com> <39F5DBF8.48F91EDE@cotw.com>
Subject: Re: Proper way of setting MTD_DEBUG
Date: Tue, 24 Oct 2000 14:57:53 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ahh... I'm looking at an older version (the one in 2.4.0-test7).

Regards,
Brad

----- Original Message ----- 
From: "Steven J. Hill" <sjhill@cotw.com>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <mtd@infradead.org>
Sent: Tuesday, October 24, 2000 2:59 PM
Subject: Re: Proper way of setting MTD_DEBUG


> "Bradley D. LaRonde" wrote:
> > 
> > What is the proper way of setting MTD_DEBUG?
> > 
> I re-wrote the debugging such that it is now a configuration
> option in the MTD sub-system menu where you choose the level
> of verbosity. There a four levels which are defined in the
> 'include/linux/mtd/mtd.h' that you can use to define the
> severity/verbosity of a debug statement.
> 
> -Steve
> 
> -- 
>  Steven J. Hill - Embedded SW Engineer
>  Public Key: 'finger sjhill@mail.cotw.com'
>  FPR1: E124 6E1C AF8E 7802 A815
>  FPR2: 7D72 829C 3386 4C4A E17D



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
