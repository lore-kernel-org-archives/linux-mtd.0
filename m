Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEemV-0001PR-AP
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 07:33:10 +0000
Subject: Re: [PATCH 1/3] [MTD-UTILS] Unified reading from standard input
	and from file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <h0mppp$7v2$1@ger.gmane.org>
References: <h0k3il$ij6$1@ger.gmane.org>
	<1244551983.5847.388.camel@localhost.localdomain>
	<4A2E98BD.30704@orb.com> <h0mppp$7v2$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Jun 2009 10:32:21 +0300
Message-Id: <1244705541.5847.412.camel@localhost.localdomain>
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

On Tue, 2009-06-09 at 16:04 -0700, Jehan Bing wrote:
> Use same code path for reading data (not the OOB) from either the 
> standard input or a regular file.
> 
> Signed-off-by: Jehan Bing <jehan@orb.com>

The patches look OK to me, but I do not have time to review them very
really well. So would it please be possible to describe how you tested
them to convince me they are ok? Then I'd push them to mtd-utils.git
tree. Did you test writing with/without oob, from file/stdin, etc?

Thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
