Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2nwj-0003cK-99
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 06:36:51 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.62.54])
	(envelope-sender <bernhard@prie.de>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Aug 2005 10:36:27 -0000
Message-ID: <42F9D8C5.9060008@prie.de>
Date: Wed, 10 Aug 2005 12:36:53 +0200
From: Bernhard Priewasser <bernhard@prie.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <42F9BA34.6090008@prie.de>
	<20050810083828.GA16583@wohnheim.fh-wedel.de>
	<42F9BF5F.7060603@prie.de> <42F9C28D.4070206@yandex.ru>
	<42F9C4AF.6030505@prie.de> <42F9C612.2050301@yandex.ru>
	<42F9C980.7030301@prie.de>
	<20050810100557.GA18149@wohnheim.fh-wedel.de>
In-Reply-To: <20050810100557.GA18149@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> Please always reply to all.  I hate to miss interesting stuff, just
> because some idiot removed me from the Cc: list.
Better now? ;-)

 > The next flash FS, whatever it will look like, will not be log
 > structure anymore.  At least, noone I know of is trying to follow that
 > road anymore.  Log-structuring simply doesn't scale.
But log-structuring and handling failsafe issues works comfortable and 
reliable... What's another solution, in matters of (a) robustness and 
(b) scaling?

Bernhard
