Received: from marmot.wormnet.eu ([2a03:9800:10:2d:3203:b3a5:8bdc:5b68])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTrpn-0002wJ-4g
 for linux-mtd@lists.infradead.org; Sun, 21 Apr 2013 10:49:28 +0000
Date: Sun, 21 Apr 2013 11:49:20 +0100
From: Alexander Clouter <alex@digriz.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: plat_nand: add further DT bindings and documentation
Message-ID: <20130421104920.GR2917@edkhil>
References: <1364124453-899-1-git-send-email-alex@digriz.org.uk>
 <20130329225353.GQ7123@edkhil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20130329225353.GQ7123@edkhil>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bueller?

On Fri, Mar 29, 2013 at 10:53:53PM +0000, Alexander Clouter wrote:
>Anyone with any suggestions on what should be done with this patch? 
>For my DT platform porting, is it okay for me to continue making use 
>of this work?  Or is there a plan to kill plat-nand?
>
>I am suspecting folks are aghast with horror at the thought of having 
>plat-nand breeding with devicetree?
>
>On Sun, Mar 24, 2013 at 11:27:33AM +0000, Alexander Clouter wrote:
>>The plat_nand driver has some devicetree support but it is currently
>>unusable, especially as there is no documentation on how to use it.
>>
>>This patch adds the much needed documentation as well as adds some common
>>properties (bank-width, chip-delay, bbt-use-flash and nr-chips) removing
>>further use of the platform_nand_data struct.
>>
>>Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
>>---
>>.../devicetree/bindings/mtd/plat-nand.txt          |   93 ++++++++++++++++++++
>>drivers/mtd/nand/plat_nand.c                       |   53 ++++++++---
>>2 files changed, 134 insertions(+), 12 deletions(-)

-- 
Alexander Clouter
.sigmonster says: Even moderation ought not to be practiced to excess.
