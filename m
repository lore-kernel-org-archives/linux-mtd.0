Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1954v3-0005ZA-GI
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 15:26:49 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDC00H9I840CU@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 14 Apr 2003 16:26:24 +0200 (MEST)
Date: Mon, 14 Apr 2003 17:26:25 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030414090608.470dca32.emanning@austin.rr.com>
To: Earl Manning <emanning@austin.rr.com>
Message-id: <200304141726.25126.tglx@linutronix.de>
MIME-version: 1.0
References: <002901c3021b$546a6fe0$525deecb@noshel>
	<20030414090608.470dca32.emanning@austin.rr.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: A question on ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 14 April 2003 16:06, Earl Manning wrote:
> Althought, it does sound like new writes do use the SOFT ECC flag and that
> is why there are no complaints.  How did you get the ECC stuff into the OOB
> to start with?
I think you missunderstand it again. :)
The offending message
"Reading data from NAND FLASH without ECC is not recommended". 
is printed, if nand_read_ecc is called with a oobinfo structure, which has set 
useecc to zero or without a oobinfo pointer.
That's not related to writing data with or without ECC. 

Please read and understand the code there and then post helpful suggestions.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
