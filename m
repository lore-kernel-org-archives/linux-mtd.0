Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKNZP-0005rV-9I
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2003 19:55:59 +0000
From: Cam Mayor <cmayor@iders.ca>
To: hking <hking@qualcomm.com>, linux-mtd@lists.infradead.org
Date: Thu, 13 Nov 2003 13:55:55 -0600
References: <200311121031.08597.hking@qualcomm.com>
In-Reply-To: <200311121031.08597.hking@qualcomm.com>
MIME-Version: 1.0
Message-Id: <03111313555502.02424@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Problem: erase mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 12 November 2003 12:31, hking wrote:
> This is what I got after I added three custom partitions in the physmap.c:
> After the kernel (2.4.20) boots up, I logged in as root and type:
> #cat /proc/mtd
> == and I got:
> dev:    size   erasesize  name
> mtd0: 00040000 00040000 "ResetWord"
> mtd1: 01ec0000 00040000 "User FS"
> mtd2: 00100000 00040000 "UBOOT"
>
>
> The size, erasesize and name look correct.  It does not say the starting
> point of each partitions.  Since our first and third partition are
> write-protected, so I tried to erase the mtd1.
>
>
> And I typed:
> #erase /dev/mtd1
> == and I got:
> File open error

try unlocking that device before erasing.  my flash (YMMV) powers up to a 
locked state.  (read the rest of this email first)

> And I typed:
> #eraseall /dev/mtd1
> == and I got:
> eraseall: /dev/mtd1: No such device

check your /dev/mtd? entries against ./Documentation/devices.txt
are the major/minor numbers correct?

cam

-- 
Cameron Mayor
Iders Incorporated

As of Decemeber 1, 2003			Until November 30, 2003
100-137 Innovation Drive		600A Clifton Street
Winnipeg, MB, Canada R3T 6B6		Winnipeg, MB Canada R3G 2X6

hi Luc
