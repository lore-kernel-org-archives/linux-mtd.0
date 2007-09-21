Received: from post-26.mail.nl.demon.net ([194.159.73.196])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYepA-0007jX-8N
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 05:29:31 -0400
Message-ID: <46F379E2.2090402@m8.nl>
Date: Fri, 21 Sep 2007 09:59:30 +0200
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Bug in cmdlinepart.c?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear sirs,

I asked this question in the forum on blackfin.uclinux.org and the gave 
me this email addres to post my mail to.


In drivers/mtd/cmdlinepart.c there is the following piece of code:

if( strncmp(s, "ro", 2) == 0 )
{
 mask_flags |= MTD_WRITEABLE;
s+=2;
}

Is this correct? When the partition is defined to be read-only (ro) the 
MTD_WRITEABLE flag is set? I guess this should be:

if( strncmp(s, "ro", 2) == 0 )
{
 mask_flags &= (~MTD_WRITEABLE); // disable the writeability
s+=2;
}else
{
 mask_flags |= MTD_WRITEABLE; // enable the writeability
}


I hope you can answer my  question. Thanks in advance.

Servaes Joordens
M8


-- 

Servaes Joordens

-------------------------------------------
M8
Tappersweg 29
2031ET	Haarlem
The Netherlands
Tel:	+31 23 5311122
Mob:	+31 6 51183379
Fax:	+31 23 5322388

VAT-ID: nl-813029090B01
kvk:	34131430 Haarlem
