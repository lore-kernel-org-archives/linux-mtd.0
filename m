Received: from ns1.nougen.com ([216.185.81.251] helo=mail.nougen.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dSix-0001g0-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 09:07:39 +0000
Message-ID: <027b01c1b9ef$992c63b0$f801a8c0@minibm>
From: "Chung Ming" <min@hello.org>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <021101c1b9b5$247c0050$f801a8c0@minibm>  <01b401c1b97e$04d09180$f801a8c0@minibm> <00de01c1b8ac$928d8b40$f801a8c0@minibm> <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal> <17136.1014059667@redhat.com> <18943.1014154225@redhat.com>  <11325.1014195063@redhat.com>
Subject: Re: "No Flash Chips Recognized." error. 
Date: Wed, 20 Feb 2002 17:18:42 +0800
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

It's a M-sys DoC Millenium, 8MB,  MD-2800-D08, I have tried dozens of times,
and one time I got accidentally detected it, then I can't detect again, I am
not sure if this is a hardware problem, or maybe this parts is dead ?

Regards.

Ming.


----- Original Message -----
From: David Woodhouse
To: Chung Ming
Cc: linux-mtd@lists.infradead.org
Sent: Wednesday, February 20, 2002 4:51 PM
Subject: Re: "No Flash Chips Recognized." error.



min@hello.org said:
> ahhh!! ok,now I got
> mfr = 98, ID = 98.

Hmmm. That's odd - getting the same value for the chip ID as for the
manufacturer looks suspicious. Precisely what model/size of DiskOnChip is
this?

--
dwmw2
