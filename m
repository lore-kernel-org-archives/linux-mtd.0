Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2mve-0001HI-HR
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 05:31:22 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.62.54])
	(envelope-sender <bernhard@prie.de>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Aug 2005 09:31:17 -0000
Received: from [192.168.0.141] (linux-og [192.168.0.141])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 162155B89
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Aug 2005 11:30:43 +0200 (CEST)
Message-ID: <42F9C980.7030301@prie.de>
Date: Wed, 10 Aug 2005 11:31:44 +0200
From: Bernhard Priewasser <bernhard@prie.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42F9BA34.6090008@prie.de>	<20050810083828.GA16583@wohnheim.fh-wedel.de>	<42F9BF5F.7060603@prie.de>
	<42F9C28D.4070206@yandex.ru> <42F9C4AF.6030505@prie.de>
	<42F9C612.2050301@yandex.ru>
In-Reply-To: <42F9C612.2050301@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Bernhard Priewasser wrote:
>> Ferenc Havasi's improvements are doing well? Confusing...
> His improvements are going to go into JFFS2 AFAIK

Ah, OK. To sum up (for my understanding): Ferenc's improvements (mount 
time, compression) were - beside others - part of JFFS3. JFFS3 design in 
its current form is not satisfactory, it will be cancelled. Anyway, 
Ferenc's improvements are good and should/will be merged into JFFS2.
In parallel, there are some ideas for solving JFFS2 problems like 
described in the (very nice) "JFFS3 design issues" (scaling: mount time, 
memory consumption, access time). This will be the "new" JFFS3, current 
solutions for scaling and stuff are not available or not satisfactory.
Correct until now? Still a bit confusing :)

Bernhard
