Received: from web11603.mail.yahoo.com ([216.136.172.55])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5cxu-0003jP-6B
	for linux-mtd@lists.infradead.org; Sun, 27 Feb 2005 23:57:07 -0500
Message-ID: <20050228045701.31920.qmail@web11603.mail.yahoo.com>
Date: Sun, 27 Feb 2005 20:57:01 -0800 (PST)
From: prasadam kumar <prasadamkumar@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: mtd cfi_cmdset_0001.c writing problem 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 
 hai ,
   
   Thanks for response to my query, as u suggested i
checked 
the flash image with my original image, i found that
there is a 
some mismatch. Using fis it is writing properly to
flash but when 
i am trying to write through mtd drivers (here
versiong is 2.4.19)
it is changing some bits and writing to the flash, I
tryed a lot but 
i am unable to find why it is behaving like that. i am
using 
IQ80321 flash and cfi_cmdset_0001.c to update the
flash. 
plz help me out

 
bye
prashanth


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Sports - Sign up for Fantasy Baseball. 
http://baseball.fantasysports.yahoo.com/
