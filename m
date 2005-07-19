Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DurFJ-00083U-Es
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 08:31:01 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id F2C3BB951
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:30:47 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83123-10 for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:30:28 +0200 (CEST)
Received: from [192.168.0.77] (mail.iskramedical.si [193.77.157.20])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id BF393B917
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:30:27 +0200 (CEST)
Message-ID: <42DCF262.4040304@cetrtapot.si>
Date: Tue, 19 Jul 2005 14:30:26 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42DCD1D3.8070303@cetrtapot.si>	<42DCD6C1.6010509@yandex.ru>	<42DCDCDA.2090909@cetrtapot.si>	<42DCDE8C.702@yandex.ru>	<42DCE7E4.2050303@cetrtapot.si>	<42DCEC94.8050505@yandex.ru>
	<42DCEFD6.8010006@cetrtapot.si>
In-Reply-To: <42DCEFD6.8010006@cetrtapot.si>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hinko Kocevar wrote:

> 
> I've spotted possible problem here - it seems that kernel overwrites 
> part of the rootfs at the begining - I have reserved 0xe0000 for kernel 
> partition, but I noticed that my newer kernels are larger than this. 
> Need to check this out...
> 

Yep, that was it. If my memory serves me well, I already had similar problems a 
while ago when I had to raise the kernel mtd partition from ~600k to 900k.

Where is this re-sizing gonna stop? ;)

Sorry for the noise.

-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
