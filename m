Received: from lakemtao04.cox.net ([68.1.17.241])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17UbHw-0003R6-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Jul 2002 23:59:25 +0100
Received: from cox.net ([68.14.80.72]) by lakemtao04.cox.net
          (InterMail vM.5.01.04.05 201-253-122-122-105-20011231) with ESMTP
          id <20020716225855.RWLQ4949.lakemtao04.cox.net@cox.net>
          for <linux-mtd@lists.infradead.org>;
          Tue, 16 Jul 2002 18:58:55 -0400
Message-ID: <3D34A60B.5000504@cox.net>
Date: Tue, 16 Jul 2002 19:02:35 -0400
From: dtyree <dtyree7@cox.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: more DOC questions
Content-Type: text/plain; charset=us-ascii; format=flowed
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

   I realize most DOC questions been beaten to death, but I haven't seen 
a recent update or sufficient answers, so here it goes again.   How can 
I put  multiple JFF2 filesystems on a disk on chip (nftl or mtd)?
   I agree with dwmw2's analysis of flash filesystems. In a june 2002 
email to Brendan Simon, David Woodhouse said:
   "Recently, JFFS2 has also had support added for NAND flash, and that 
should be about ready for use now. I'd want to spend three or four weeks 
on it before letting a customer have it (and as ever I wish somebody 
would just give my masters enough money to let me do that...:) There are 
some rough edges and it needs a lot more testing, but it's basically 
working already.We may need to fix the physical DiskOnChip driver to 
accept reads which aren't precisely 512 bytes long, if nobody's done so 
already -- but that should be simple enough."

  Ok then, where can I get this cut 'o code? Wil/Is this work(ing) 
through the MTD device or the NFTL? I wish I had the clout to get my 
company to pay DMW2 to do it, but they won't even spring for nor flash 
(not even More flash).

 My device has obscene application requirements. I need a compressed 
filesystem.  

  I can see the eraseall and nftl_format utilities need to be more M-sys 
like. I may be able to help with this.
 
Dtyree
