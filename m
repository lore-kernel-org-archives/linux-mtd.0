Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxKos-0001ZQ-1k
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 04:30:00 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 33D5A2F016
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 08:37:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 7685C12137
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 10:29:43 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id B14F811CAA
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 10:29:42 +0200 (CEST)
Message-ID: <42E5F474.7020003@imc-berlin.de>
Date: Tue, 26 Jul 2005 10:29:40 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>	<20050722115939.GA941@wohnheim.fh-wedel.de>	<42E0E2C8.7090304@yandex.ru>
	<42E5E816.5090500@inf.u-szeged.hu>	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
In-Reply-To: <42E5ECE5.4010901@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc,

>>> If it is true we will clean it (or partially rewrite if necessery) 
>>> just please say some words about exactly why and where it is messy.
>>
>>
>> Can you post a patch or a URL to it?
> 
> 
> You can download from here:
> 
> http://www.inf.u-szeged.hu/jffs2/mount.php

Is there any chance to extend the code so that EBS will use the first mount to 
generate a summary instead having the need of a user space tool to create an 
JFFS2 image with EBS?


--
Steven
