Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7rV3-00075K-ID
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 05:24:56 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.120.114])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay01.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 24 Aug 2005 09:24:47 -0000
Message-ID: <430C3CDE.5020008@gmail.com>
Date: Wed, 24 Aug 2005 11:24:46 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
References: <0ILP000HJ8JG7E@mmp1.samsung.com>
In-Reply-To: <0ILP000HJ8JG7E@mmp1.samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Which directory are you patch? MTD-CVS or kernel?
I ran it outside the kernel tree:
[...]/mtd/> patch -p1 onenand-bbm.patch
Trying it inside the kernel tree results in the same errors:
/usr/src/linux> patch -p1 /[...]/mtd/onenand-bbm.patch

 > 1. patching onenand-syncread.patch (check previous e-mail)
 > 2. onenand-bbm.patch
 > 3. omap-onenand.patch
This order works better in some way: fewer fails :-) But errors anyway.

Did you try to apply the patches? In which way exactly? Applying them in 
the correct order helps a bit, but I can't see any difference between 
inside/outside kernel tree. Should I?...
But I'm not sure, because:
 > Perhaps it's a silly fault... I'm new to diff/patch, sorry.
:-)

Ah, one thing: inline mail attaching onenand-syncread.patch causes some 
incorrect line wrappings which have to be corrected manually before 
running patch. Perhaps it would be better to send them really as .patch 
files.

Regards,
Bernhard
