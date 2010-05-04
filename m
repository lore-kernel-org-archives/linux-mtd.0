Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9I0N-0007mE-CW
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 13:17:44 +0000
Subject: Re: [PATCH 1/2] mtd/chips: add SST39WF160x NOR-flashes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
References: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 04 May 2010 16:11:13 +0300
Message-ID: <1272978673.3702.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-27 at 04:19 +0200, Wolfram Sang wrote:
> Due to a broken CFI, they have to be added to jedec_probe.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> ---
> 
> Sadly, those two cannot be detected using Guillaume's SST-patchset.
> 
>  drivers/mtd/chips/jedec_probe.c |   30 ++++++++++++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)

Pushed both to my l2-mtd-2.6 / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
