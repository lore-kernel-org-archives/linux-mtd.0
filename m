Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTntg-0001Hs-Rk
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:28:09 +0000
Subject: Re: [PATCH] mtd: denali: detect the number of banks before
	resetting NAND
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1307376694-17905-1-git-send-email-jamie@jamieiles.com>
References: <1307376694-17905-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 07:23:26 +0300
Message-ID: <1307420606.11104.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2011-06-06 at 17:11 +0100, Jamie Iles wrote:
> Commit c89eeda810f0ec4f0eee0206ebb79e476df9f83e (mtd: denali: detect the
> number of banks) introduced runtime detection of the number of banks.
> 
> However, denali_nand_reset() uses uses denanli_nand_info::max_banks so
> we need to detect the maximum number of banks before doing the reset.
> 
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Pushed to l2-mtd-2.6.git, thanks.

> Artem, I believe that this one will be needed for 3.0 to avoid breakage
> on Moorestown.

All the upstream merging is done by David, not me.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
