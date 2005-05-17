Received: from web52704.mail.yahoo.com ([206.190.39.155])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXxmF-0004Iw-2o
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 04:50:11 -0400
Message-ID: <20050517085013.52899.qmail@web52704.mail.yahoo.com>
Date: Tue, 17 May 2005 01:50:13 -0700 (PDT)
From: Gianluca Moro <giangiammy@yahoo.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Buffer circolari
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm testing a MTD device (I'm using Am29LV640MU AMD flash)
to store information in a circular buffer structure.

My problems are the following:

1 - I tested the writing time with the following command:
    # time  dd if=rnd100k of=/dev/mtd3
    real    0m 5.61s
    user    0m 0.01s
    sys     0m 3.46s

   I get 3.46s: that is a least 5 time slower of expected:
   if I write directly to MTD device, which overhead are
   present: is it possible to lower that write time?

2 - I need to implement a circular buffer writing: 
    any experience about the better structure to use?
    I have installed a JFFS2 on that mtd, but is a good
    idea to use files to implement circular buffer structure?
    Or is there some better choice?

Thanks
giammy

 



		
___________________________________ 
Nuovo Yahoo! Messenger: E' molto più divertente: Audibles, Avatar, Webcam, Giochi, Rubrica… Scaricalo ora! 
http://it.messenger.yahoo.it
