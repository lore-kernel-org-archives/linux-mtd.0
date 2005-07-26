Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxN1m-0003rR-KE
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 06:51:22 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 574F12F016
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 10:59:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 9943512139
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 12:51:12 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id D408411CAA
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 12:51:11 +0200 (CEST)
Message-ID: <42E6159D.10302@imc-berlin.de>
Date: Tue, 26 Jul 2005 12:51:09 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>	<20050722115939.GA941@wohnheim.fh-wedel.de>	<42E0E2C8.7090304@yandex.ru>
	<42E5E816.5090500@inf.u-szeged.hu>	<20050726074440.GB15903@wohnheim.fh-wedel.de>	<42E5ECE5.4010901@inf.u-szeged.hu>
	<42E5F474.7020003@imc-berlin.de>
	<20050726093624.GE15903@wohnheim.fh-wedel.de>
	<42E60A81.7070508@inf.u-szeged.hu>
In-Reply-To: <42E60A81.7070508@inf.u-szeged.hu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
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

Ferenc Havasi wrote:

> Jörn Engel wrote:
> 
>>> Is there any chance to extend the code so that EBS will use the first 
>>> mount to generate a summary instead having the need of a user space 
>>> tool to create an JFFS2 image with EBS?
>>
>>
>> That's a lot of code for something inherently inefficient.  EBS should
>> create summaries for *new* blocks that are written, sure.  But if you
>> try to GC every single block without summary, your mount time will be
>> well beyond it would have been without EBS.
> 
> 
> I agree. It would be technically difficult to implement and would make 
> the first mount time very-very long.

Ah. I see. I did not know it would cretae that much hassle.

But then: what is the status of CS? For NOR?

--
Steven
