Received: from smtprelay02.ispgateway.de ([80.67.18.14])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAlPS-0008QV-MI
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 05:31:18 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.94.177])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay02.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 1 Sep 2005 09:31:03 -0000
Message-ID: <4316CA53.7070201@gmail.com>
Date: Thu, 01 Sep 2005 11:30:59 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
References: <0ILR00B812WSF3@mmp1.samsung.com>
In-Reply-To: <0ILR00B812WSF3@mmp1.samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,

please let me bother you with another question.
It's about scanning for bad blocks during reading/writing flash (/* TODO 
handling oob */...)
What's the possibility of having a bad block at r/w? OneNAND spec isn't 
very extensive regarding handling bad blocks beside the initial scan. 
Which things must/should be done by the flash driver, which ones by the 
file system in this case?
I would be very grateful if you could give me a brief outline, I'm 
afraid BBM is a bit "too new" for us because we are used to operate on 
plain NOR... :-)

Thanks,
Bernhard


PS: Kyungmin, sorry for double mail
