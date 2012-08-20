Received: from mo1.mail-out.ovh.net ([178.32.228.1])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3MqC-0005cd-Ii
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 07:56:05 +0000
Received: from mail31.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with SMTP id 26DD9FF8B00
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 10:02:59 +0200 (CEST)
Date: Mon, 20 Aug 2012 09:56:12 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH 1/8] arm: sam9_l9260_defconfig: adjust UBI bad
 eraseblocks limit
Message-ID: <20120820075612.GD7439@game.jcrosoft.org>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-2-git-send-email-richard.genoud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345214124-5478-2-git-send-email-richard.genoud@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16:35 Fri 17 Aug     , Richard Genoud wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> UBI has changed the MTD_UBI_BEB_LIMIT semantics. It used to be a percent of
> total amount of eraseblock in the partition, and now it is the maximum
> amount of bad eraseblocks on the entire devise per 1024 eraseblocks. So not
> only the units changed, but also the meaning. But anyway, old 3% roughly
> correspond to new 30, so change the defconfig correspondingly.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
simply drop this defconfig

Best Regards,
J.
