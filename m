Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bckh2-0002Cr-Qq
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2004 08:48:09 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004062208584625019
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2004 08:58:46 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812CB@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Jun 2004 08:49:51 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: FW: DOC Mil Plus 32 question erase size erase shift????
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What should the buffer size be for an erase block in memory.  How is that
value tied to the chip geometry???

Thanks,
John

-----Original Message-----
From: Thomas Gleixner [mailto:tglx@linutronix.de] 
Sent: Monday, June 21, 2004 5:28 PM
To: Carlos, John J USAATC
Subject: Re: DOC Mil Plus 32 question erase size erase shift????


On Monday 21 June 2004 23:32, you wrote:
> Hi Thomas,
>
>   I will look again at where I get the value of erasesize.  I thought 
> I read it in the DOC pdf file???  I am not at work now so in the 
> morning I will see where I have gone wrong and let you know.

Oh, the device operates in interleave-2 16 bit mode. This is a seperate
issue 
which we have to check.

-- 
Thomas _____________________________________________________________________
>From slash dot org
"When customers are visiting, engineers are not allowed to wear ties. 
That way the customer can tell who is the engineer and who is the 
salesman (and therefore whom to believe.). Ties cut off blood flow 
to the brain, making it easier for the salesmen to do their jobs." 
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
