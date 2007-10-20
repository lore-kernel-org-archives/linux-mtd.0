Received: from py-out-1112.google.com ([64.233.166.182])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjH6H-0005qh-ER
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 17:22:59 +0100
Received: by py-out-1112.google.com with SMTP id a25so1576931pyi
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Oct 2007 09:22:35 -0700 (PDT)
Message-ID: <7ee965bc0710200922n2159c5dav4357d1cdce5521e8@mail.gmail.com>
Date: Sat, 20 Oct 2007 09:22:34 -0700
From: "Sun Devil" <sundevil007@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: FTLs for NANDSim
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi  All ...

I'm a newbie to Flash, and actually found NANDSim pretty much
interesting to make my own FTL to interface on to it and measure
several metrics of the existing FTLs too. But, I'm stumped by the fact
that NANDSim runs in Kernel Mode. Can you kindly clarify my following
questions?

1. Can we write an user level FTL and interface with NANDSim, so that,
for the application, simulated flash appears to be a physical device,
and I can format the same volume in what ever way possible?

2. Do you have any implementations of FTL at Kernel level?

3. Are there any NAND Flash simulators that you know of apart from NANDSim?

Thanks a lot!!

Rgds
Sai
