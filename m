Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 164kum-0001Eh-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 15:28:24 +0000
Subject: Caching of reads
From: Ian Campbell <icampbell@arcom.co.uk>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 16 Nov 2001 15:37:10 +0000
Message-Id: <1005925030.25782.27.camel@LinuxDev>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Good afternoon,

I've checked the documentation and list archives and I can't find
anything which refers to my problem...

It seems as if reads from a JFFS2 file system are not being cached as we
would expect, for instance this small script:

while true ; do
sleep 1
done

causes a read from the flash every time the sleep is executed. This is
true even if the fs is mounted read only.

This is with a 2.4.14 kernel (and the JFFS2 therein), does anyone have
any clue as to what might be going on?

Thanks IA,
Ian.

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 411200 ext. 3204
E-Mail: icampbell@arcom.co.uk
Web: http://www.arcomcontrols.com


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre. 

Company registered in England No. 1608562.
Registered Office: Unit 8, Clifton Road, Cambridge, CB1 7EA, United Kingdom, Tel: 01223 411200.
