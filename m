Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DuquR-0007K4-Fl
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 08:09:27 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 350B22F017
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 12:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 6F926120FD
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:09:09 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id AF62611CAA
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:09:08 +0200 (CEST)
Message-ID: <42DCED64.4050900@imc-berlin.de>
Date: Tue, 19 Jul 2005 14:09:08 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <42DCD1D3.8070303@cetrtapot.si>	<42DCD6C1.6010509@yandex.ru>	<42DCDCDA.2090909@cetrtapot.si>	<42DCDE8C.702@yandex.ru>	<42DCE7E4.2050303@cetrtapot.si>
	<42DCEC94.8050505@yandex.ru>
In-Reply-To: <42DCEC94.8050505@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

> Hinko Kocevar wrote:
> 
>> There you go. This is with JFFS2 debug set to 2 and MTD debug set to 3.
>> ...
>> NET: Registered protocol family 17
>> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 
>> 0x234a instead
> 
> 
> Even though you enabled JFFS2 debugging,
> the debugging messages are not seen on your console.

Maybe

	echo 8 > /proc/sys/kernel/printk

???

--
Steven
