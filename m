Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ck9AV-0003k8-L4
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2004 17:53:20 -0500
Received: by wproxy.gmail.com with SMTP id 37so111078wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Dec 2004 14:53:16 -0800 (PST)
Message-ID: <6934efce04123014525f17be83@mail.gmail.com>
Date: Thu, 30 Dec 2004 14:52:18 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: llandre <r&d2@dave-tech.it>
In-Reply-To: <6.0.1.1.0.20041230103615.01f4d508@192.168.2.1>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
	<6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
	<6934efce041228094447dbfbd1@mail.gmail.com>
	<6.0.1.1.0.20041229093407.01f20e88@192.168.2.1>
	<6934efce041229202370761a59@mail.gmail.com>
	<6.0.1.1.0.20041230103615.01f4d508@192.168.2.1>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to exploit STS pin of Strata Flash
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I see. So far I worked with Intel StrataFlash only.

Even some new Intel StrataFlash does not have this pin.

> Yes, I have encountered this problem with a Frescale MC9328MXL processor.
> The flickering occurs when JFFS2 performs erase/write operations on the
> StrataFlash. This happens with Linux 2.6 only. When running
> Linux 2.4 LCD exhibits no flickering.

Uh oh.  Same bootloader, hardware and everything?  I wonder what
changed from 2.4 to 2.6 that would change that.

Anybody have any ideas?
