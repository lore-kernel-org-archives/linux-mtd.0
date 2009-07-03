Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMca2-0001Z4-G4
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 06:49:12 +0000
Subject: Re: [PATCH] ubifs: allow more than one volume to be mounted
From: Artem Bityutskiy <dedekind@infradead.org>
To: Daniel Mack <daniel@caiaq.de>
In-Reply-To: <1246547747-13366-1-git-send-email-daniel@caiaq.de>
References: <1246547747-13366-1-git-send-email-daniel@caiaq.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jul 2009 09:48:44 +0300
Message-Id: <1246603724.20721.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-02 at 17:15 +0200, Daniel Mack wrote:
> UBIFS uses a bdi device per volume, but does not care to hand out unique
> names to each of them. This causes an error when trying to mount more
> than one volumes.

I've simplified your patch a little and pushed to ubifs-2.6.git. Also
amended the MAINTAINERS file:

http://git.infradead.org/ubifs-2.6.git?a=commit;h=72093a661c0bd06d4843ac0ef8b909645483031b
http://git.infradead.org/ubifs-2.6.git?a=commit;h=42feebfc9af4ab505cacb0ea20bef35957ef2676

I'll send this fix to Linus in few days.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
