Received: from grupoclave.com ([130.94.157.108])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kOFT-0005gg-Q2
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 14:22:39 +0100
Received: from unknown (HELO salguero?1.grupoclave.com) ([200.82.54.25])
	(envelope-sender <lskladnik@grupoclave.com>)
	by 130.94.157.108 (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 6 Aug 2003 13:22:26 -0000
Message-ID: <C0AA6C69A265D311ACCA0090274F09AD011944B3@SALGUERO_1>
From: Leandro Skladnik <lskladnik@grupoclave.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 6 Aug 2003 10:21:44 -0300 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: mmap with Doc Millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list members!

I have the following question:

Is it posibble to use mmap with a Disc On Chip device? Because a tried to
use it but I received MAP_FAILED returning from mmap, and errno set to 19,
which means, according to "errno.h", "No such Device". 

I think maybe the driver I'm using does not implement mmap. So, how can I
know if the driver support mmap and in case it didn't, how can I change the
Doc Driver?

Since now, thanks

Leandro
