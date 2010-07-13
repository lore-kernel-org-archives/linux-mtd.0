Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYaVw-0001La-3Q
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 08:06:52 +0000
Subject: Re: [PATCH] mtd/nand: Edit macro flag for BBT scan of last page in
	block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1277325362-13326-1-git-send-email-norris@broadcom.com>
References: <1277325362-13326-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 11:01:39 +0300
Message-ID: <1279008099.30765.0.camel@localhost>
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

On Wed, 2010-06-23 at 13:36 -0700, Brian Norris wrote:
> NAND_BB_LAST_PAGE used to be in nand.h, but it pertained to bad block
> management and so belongs next to NAND_BBT_SCAN2NDPAGE in bbm.h. Also,
> its previous flag value (0x00000400) conflicted with NAND_BBT_SCANALLPAGES
> so I changed its value to 0x00008000. All uses of the name were modified to
> provide consistency with other "NAND_BBT_*" flags.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
