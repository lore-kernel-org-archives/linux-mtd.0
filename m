Received: from ns1.nougen.com ([216.185.81.251] helo=mail.nougen.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e9VO-0005Hb-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 06:48:30 +0000
Message-ID: <064e01c1bb6e$8011ee60$f801a8c0@minibm>
From: "Chung Ming" <min@hello.org>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <027b01c1b9ef$992c63b0$f801a8c0@minibm>  <021101c1b9b5$247c0050$f801a8c0@minibm> <01b401c1b97e$04d09180$f801a8c0@minibm> <00de01c1b8ac$928d8b40$f801a8c0@minibm> <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal> <17136.1014059667@redhat.com> <18943.1014154225@redhat.com> <11325.1014195063@redhat.com>  <24219.1014280209@redhat.com>
Subject: Re: "No Flash Chips Recognized." error. 
Date: Fri, 22 Feb 2002 14:59:38 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Got it working after replace a new DoC Millenium. that DoC was DIED. so we
can found it but with strange IDs that not recognized by MTD.

Thank you very much for help me, david.

----- Original Message -----
From: David Woodhouse
To: Chung Ming
Cc: linux-mtd@lists.infradead.org
Sent: Thursday, February 21, 2002 4:30 PM
Subject: Re: "No Flash Chips Recognized." error.



min@hello.org said:
> It's a M-sys DoC Millenium, 8MB,  MD-2800-D08, I have tried dozens of
> times, and one time I got accidentally detected it, then I can't
> detect again, I am not sure if this is a hardware problem, or maybe
> this parts is dead ?

Very strange. Maybe it's a timing problem. Ollie?

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
