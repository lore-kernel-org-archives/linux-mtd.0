Received: from rproxy.gmail.com ([64.233.170.207])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CP75G-0005vm-4w
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2004 17:24:59 -0500
Received: by rproxy.gmail.com with SMTP id i8so15530rne
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2004 14:24:39 -0800 (PST)
Message-ID: <a084b59f04110214246b8b4a76@mail.gmail.com>
Date: Tue, 2 Nov 2004 17:24:39 -0500
From: Ed Berube <eberube@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Possible small bug in nand_base.c
Reply-To: Ed Berube <eberube@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using the CVS most recent code.  On a recent update I found what I
believe is a small error in nand_base.c

In the latest update, nand.h - eccbytes was added to the nand_chip structure.  

This is because of the changes made to nand_base.c

However on line 844.  The line is 

eccbytes = this->ecc_bytes;
I believe it should be without the underbar

eccbytes = this->eccbytes;


I apologize if this is the incorrect place to post this - if so,
please inform me of the correct way and I will do some from now on. 
Or if its has already been dealt with please ignore this, I just
didn't see anything posted and I didn't have a cvs update to fix the
problem.

Ed
