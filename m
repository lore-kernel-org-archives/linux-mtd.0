Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CokEg-0001Jy-V9
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 10:16:40 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 545C42F016
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 16:16:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 490DA1167B
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 16:16:37 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 9FB427A1E
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 16:16:36 +0100 (CET)
Message-ID: <41E53F52.3010601@imc-berlin.de>
Date: Wed, 12 Jan 2005 16:16:34 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41E4D6E5.1090407@imc-berlin.de> <41E4EDBE.8070302@inf.u-szeged.hu>
	<41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
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


>>Well. I think when a sectors gots written correctly (and summary is correct), I 
>>have to assume that the sector stay intact. So no need for checks.
>>
>>If a sector got broken just by reading it then the whole embedded system is 
>>broken and has to be replaced ...
> 
> This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
> and *report* media problems.
Fair enough.
But how will pay attention if the system is embedded into your microwave oven or 
washing maschine... ;-)

--
Steven
