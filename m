Received: from smtprelay02.ispgateway.de ([80.67.18.14])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7a3t-0002hb-FU
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 10:47:46 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.120.114])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay02.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 23 Aug 2005 14:47:36 -0000
Message-ID: <430B3706.7080208@gmail.com>
Date: Tue, 23 Aug 2005 16:47:34 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <43098213.1020807@prie.de>
	<43099109.3050609@inf.u-szeged.hu>	<430993B1.5010502@yandex.ru>
	<20050822094433.GA10958@wohnheim.fh-wedel.de>
In-Reply-To: <20050822094433.GA10958@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: Testing JFFS2 using mtdram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > I did that for ramtd.  Allocate an array of pointers and then lazily
 > allocate memory for those pointers.

Did anyone do something similar for mtdram too?
I tried it quick & dirty, but didn't work :-) If there's a solution for 
mtdram I would be grateful, otherwise I had to try further. 
mtdram's/vmalloc()'s total size limit indeed is rather low for extensive 
testing.

Regards,
Bernhard
