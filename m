Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5S9u-0005AJ-V6
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 07:23:44 +0000
Message-ID: <1493709798.797.18.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Oleksij Rempel
 <o.rempel@pengutronix.de>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 02 May 2017 10:23:18 +0300
In-Reply-To: <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-04-11 at 22:43 +0200, Richard Weinberger wrote:
> Makes sense.
> 
> Artem, do you remember why UBIFS didn't set s_uuid in first place?

Just did not notice it I think.
