Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cm93e-00086n-EB
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 06:10:31 -0500
Message-ID: <41DBCB29.1090205@inf.u-szeged.hu>
Date: Wed, 05 Jan 2005 12:10:33 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>
	<41DBC52E.9020500@yandex.ru>
In-Reply-To: <41DBC52E.9020500@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steven,

> Try JFFS3 with "summaries" enabled or Ferenc Havasi's JFFS2 "summary" 
> patch. The mount speed should be increased with it.
> 
> Note: JFFS3 development is in progress so be ready if it has bugs.

Becauseof it, we maintain a summary patch for JFFS2. You can download 
the latest patch from http://www.inf.u-szeged.hu/jffs2/mount.php
(I'm updating the page now, so you may wait a little.)

Summary designed specially to speed up the mounttime, so it should help you.

Regards,
Ferenc
