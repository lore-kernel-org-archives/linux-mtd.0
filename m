Received: from web11507.mail.yahoo.com ([216.136.172.39])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l1YH-0008B6-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 05:43:53 +0000
Message-ID: <20020313055518.77306.qmail@web11507.mail.yahoo.com>
Date: Wed, 13 Mar 2002 05:55:18 +0000 (GMT)
From: =?iso-8859-1?q?Ajit=20Anand?= <ajit_anand@yahoo.com>
Subject: Re: kernel oops loading Doc2000
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

it modprobe's the docprobe without an oops but then
gives an error
Could not find valid boot record
Could not mount nftl device 

and when i try to erase the disk using nftl_format it
gives an error
Erase size not 8kb - I'm Confused

should i be trying something else.

ajit


--------------------------------

Documentation/oops-tracing.txt

If you run 'cvs up -D 20020306 drivers/mtd/nftl*.c'
does it start to work 
again? That reverts my experimental patch to make the
driver handle larger 
DiskOnChip devices.


--
dwmw2

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
