Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHwC3-0001EZ-4B
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2013 13:03:07 +0000
Message-ID: <1363698221.14966.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: implement chip polling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 19 Mar 2013 15:03:41 +0200
In-Reply-To: <CACna6rxL5zV8xbJS3nwVi_w_4KXoR2uYKMCfNNEA8u6k1m22Dg@mail.gmail.com>
References: <1363343486-3084-1-git-send-email-zajec5@gmail.com>
 <51434BAC.4080003@hauke-m.de>
 <CACna6rxL5zV8xbJS3nwVi_w_4KXoR2uYKMCfNNEA8u6k1m22Dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-15 at 17:43 +0100, Rafał Miłecki wrote:
> To be honest, I had bus abstraction in my code. I removed it because
> of Artem's comments in last patchset. He said he doesn't have a proof
> I'll ever add SSB support and told me to remove code that prepared
> bcm47xxsflash for abstracting bus type.

I only asked to introduce it when you actually need it. I only objected
to adding preparations without the code which uses the preparations. I
do not really know the bcm47 HW, but of course if you have a HW resource
which is shared between subsystems, you should not use it directly from
MTD, you should have some kind of framework / accessors for the
resource.
 
-- 
Best Regards,
Artem Bityutskiy
