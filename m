Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQyMT-00078q-PO
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 06:53:13 +0000
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
In-Reply-To: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Jul 2009 09:52:30 +0300
Message-Id: <1247640750.11353.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 07:49 +0530, Subrata Modak wrote:
> Following fix is inspired by David Howells fix few days back:
> http://lkml.org/lkml/2009/7/9/109,
> 
> Signed-off-by: Subrata Modak<subrata@linux.vnet.ibm.com>,
> ---

Removed junk comma at the end of "signed-off-by" and pushed to
the ubifs-2.6.git tree:

http://git.infradead.org/ubifs-2.6.git?a=commit;h=5c1507e6097c4abc13bbad69de137366c9043f22

Thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
