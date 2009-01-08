Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKyMJ-00040Y-CC
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 17:07:51 +0000
Subject: Re: Writing a ubinize'd image to fresh NANDFlash with a burner
From: Artem Bityutskiy <dedekind@infradead.org>
To: Pontus Hedman <pontushedman@navcast.com>
In-Reply-To: <1231433726.16113.8.camel@phedman.navcastinc.local>
References: <1231433726.16113.8.camel@phedman.navcastinc.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jan 2009 18:59:32 +0200
Message-Id: <1231433972.4798.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-01-08 at 11:55 -0500, Pontus Hedman wrote:
> Do I just tell the burner to skip bad blocks on write, like nandwrite
> does?

Yes, this is right.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
