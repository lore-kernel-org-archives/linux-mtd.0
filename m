Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EJmr-0006BF-QS
	for <linux-mtd@lists.infradead.org>; Sat, 10 May 2003 03:08:34 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Gregg C Levine" <hansolofalcon@worldnet.att.net>,
	<linux-mtd@lists.infradead.org>
Date: Sat, 10 May 2003 14:10:23 +1200
References: <000001c3175d$c11852e0$0100a8c0@who5>
In-Reply-To: <000001c3175d$c11852e0$0100a8c0@who5>
MIME-Version: 1.0
Message-Id: <20030510020844.D16A945B5@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: USB attached CF device readers
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> How do the MTD device drivers treat a CF card that's accessible via
> the USB port, and its associated reader? Just thought I'd ask. I'm not
> even sure how Linux will react to the reader. Or the card even. I can
> supply details about them, but on a private basis.

Firstly, and most importantly, CF - through a USB or any other interface - is 
not mtd capable, so mtd does not treat it in any way.

I have a Sandisk USB CF reader. Works great (ie. way better than with 
Windows). It uses the Mass Storage class driver. It needs SCSI/IDE configured 
and a few other things and appears as /dev/sda1.  There are various howtos on 
the www. 
