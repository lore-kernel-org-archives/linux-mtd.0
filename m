Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWVe3-0001CQ-Gj
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 14:30:40 +0000
Subject: Re: [PATCH] mtd: nand: nand_ids.c: added two entries for NAND chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1276803311-6361-1-git-send-email-norris@broadcom.com>
References: <1276803311-6361-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Jul 2010 17:26:34 +0300
Message-ID: <1278512794.12733.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-17 at 12:35 -0700, Brian Norris wrote:
> Included the basic size info for NAND chips with ID of 0xAD or
> 0xD7. The first can be found in Hynix HY27SF161G2M, while the
> second can be found in Micron MT29F64G08 and the Samsung K9LBG08U0D
> (among others). Also, some 64 Gbit (or larger) chips identify as
> 0xD7 because they contain multiple smaller 32 Gbit chips. I
> assume it's safe to classify these under the 32 Gbit listing.

I an not sure this is safe, but I guess if someone needs to support
those NANDs, they'll have to do that properly.

Pushed to l2-mtd-2.6.git / master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
