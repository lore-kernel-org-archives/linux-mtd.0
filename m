Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CpOd5-0007xg-Il
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2005 05:24:34 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id DF0422F016
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Jan 2005 11:24:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id D38C311693
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Jan 2005 11:24:24 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 329767A1E
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Jan 2005 11:24:24 +0100 (CET)
Message-ID: <41E79DD5.4050601@imc-berlin.de>
Date: Fri, 14 Jan 2005 11:24:21 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41E4D6E5.1090407@imc-berlin.de> <41E4EDBE.8070302@inf.u-szeged.hu>
	<41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
	<41E53F52.3010601@imc-berlin.de>
	<Pine.LNX.4.58.0501121519280.10617@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501121519280.10617@phoenix.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

>>>This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
>>>and *report* media problems.
>>
>>Fair enough.
>>But who will pay attention if the system is embedded into your microwave oven or 
>>washing maschine... ;-)
> 
> In this case this doesn't make sence.
> But in general it does.
> 
> Possibly it makes sence to have this checking as an configuration option.

So will someone add this config option for JFFS2?
Or should it be done in SUMMARY patch?
Are there any plans to include this SUMMARY patch to the JFFS2 CVS?
Or will it stay seperated?

--
Steven
