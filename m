Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M64ff-0005gd-1v
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 15:22:49 +0000
Subject: Re: [PATCH] [UBI] [1/3] ubi notifications API
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1241018978.20184.33.camel@hp.diimka.lan>
References: <1241018978.20184.33.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 May 2009 18:22:18 +0300
Message-Id: <1242660138.3238.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry,

I've re-work the first patch of yours. I think the locking should
be correct now. The commit message shortly list the changes I've
done.

I also send the second patch. The only thing I fixed there was
the spelling of your name - I made it start with a capital letter.
I hope you do not mind.

Please, provide the third patch. You should not try to open an
UBI volume from within a notifier, because it won't work. I
think you simply did not test your patches before sending.
Neither did I. But please, this time, do test the patches.
It is very easy to do with nansim.

I'll send the patches as 2 follow-up e-mail for your review.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
