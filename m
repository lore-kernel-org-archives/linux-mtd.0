Received: from [200.53.172.214] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15a7fT-0002OK-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 04:29:59 +0100
Message-ID: <20010824023928.3168.qmail@qis>
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: linux-mtd@lists.infradead.org
Subject: mtdchar major , 90 or 91?
Date: Fri, 24 Aug 2001 02:39:28 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Why in MAKEDEV the char device has major 90 and in mtdchar.c it has 
redefined from 90 to 91 in one of the first lines of code: 

#undef MTD_CHAR_MAJOR
#define MTD_CHAR_MAJOR 91 

I had to comment this definition in order to recognize /dev/mtd0 in the doc 
millenium ....  this is strange, why this numbers change from place to 
place? 

Nikolai
p.s.
I downloaded lastests release 2 days ago from cvs
