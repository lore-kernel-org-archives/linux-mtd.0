Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LS5EJ-00037b-Aa
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2009 07:53:02 +0000
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin78@gmail.com
In-Reply-To: <9c9fda240901271820x23993c55hba3fa5078ea6426@mail.gmail.com>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1232961503.22350.89.camel@localhost.localdomain>
	<9c9fda240901271820x23993c55hba3fa5078ea6426@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2009 09:51:46 +0200
Message-Id: <1233129106.7085.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Bergeron <mho.linux-mtd@b2n.ca>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-28 at 11:20 +0900, Kyungmin Park wrote:
> I got the similar problem with orphan node handling. with this patch,
> it's solved. but there are strange ones.
> 
> I boot with ubifs with ro mode. and then I remount it as rw. after
> some work, I remount it as ro. at that case.
> It displayed "Device busy" so I can't change the mode. Did you have any clue?

Hmm, no, I haven't seen this. Could you turn debugging on, reproduce the
bug, and see if there is anything interesting in the kernel logs?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
