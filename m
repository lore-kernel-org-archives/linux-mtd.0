Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHiCv-0002fy-0C
	for linux-mtd@lists.infradead.org; Thu, 15 Feb 2007 10:07:39 -0500
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l1FF5CYh010832
	for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2007 17:05:18 +0200
Message-ID: <45D476F9.5020804@nokia.com>
Date: Thu, 15 Feb 2007 17:06:33 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: OneNAND: Unexpected zero blocks
References: <e167438e0702150620t4291198dxd627d102cba6519f@mail.gmail.com>
In-Reply-To: <e167438e0702150620t4291198dxd627d102cba6519f@mail.gmail.com>
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

ext Julianne C. wrote:
> Is this a known problem with the onenand parts or the driver?

Not one that I know of.

> Where can one obtain a copy of the latest driver
>    (without having to use git since we can't access git archives
> behind our firewall)

I guess you could grab the files from gitweb:

http://git.infradead.org/?p=users/kmpark/onenand-mtd-2.6.git

Look in the tree at drivers/mtd/onenand
