Received: from 206-248-137-77.dsl.teksavvy.com ([206.248.137.77]
	helo=mail.isoar.ca)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIUiu-0001PV-M3
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 20:32:41 +0000
Received: from [10.0.200.176] (vpn02.rossvideo.com [209.5.118.98])
	by mail.isoar.ca (8.14.1/8.13.8) with ESMTP id m6EKWRQq001141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2008 16:32:33 -0400
Message-ID: <487BB7D9.4070505@isoar.ca>
Date: Mon, 14 Jul 2008 16:32:25 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] nand_wait_ready() timeout scaling
References: <1209583375-11136-1-git-send-email-andrewm@isoar.ca>
In-Reply-To: <1209583375-11136-1-git-send-email-andrewm@isoar.ca>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew E. Mileski wrote:
> The nand_wait_ready() timeout was hardcoded to 2 jiffies, which does not
> scale with the system timer frequency.  Using a guess of a 250 Hz system
> timer frequency, I believe the timeout was meant to be 8 ms.

Just a heads-up for those similarly banging their heads trying to get
NAND to work for them, that I think I've also found 2 instances of a
bug:  not waiting tWB before calling nand_wait_ready() in nand_base.c

   nand_do_read_ops()
   nand_do_read_oob()

I almost think the ndelay(tWB) should be in nand_wait_ready(), but I'm
still playing with it.

-- 
Andrew E. Mileski
