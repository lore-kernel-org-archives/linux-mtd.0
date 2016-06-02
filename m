Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8GTJ-00068g-9Z
 for linux-mtd@lists.infradead.org; Thu, 02 Jun 2016 00:26:50 +0000
Received: by mail-pf0-x233.google.com with SMTP id 62so23868964pfd.1
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2016 17:26:28 -0700 (PDT)
Date: Wed, 1 Jun 2016 17:26:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v7 00/10] Add error checking to spi-nor read and write
Message-ID: <20160602002624.GG89390@google.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 05, 2016 at 05:31:46PM -0700, Brian Norris wrote:
> Hi,
> 
> I'm picking up Michal's patch set, since he dropped it on the floor, and it's
> useful for others. My additions:
> 
>  * rebased on latest
>  * added fixes for drivers that have been merged in the meantime
>  * addressed most of Heiner's comments
> 
> I've put some v6->v7 change info in the patch descriptions as well.
> 
> Tested on m25p80 only.

Pushed to l2-mtd.git, with Cyrille's and Michal's {Tested,Acked}-by's.

Regards,
Brian
