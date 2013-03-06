Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDCHb-0006XJ-66
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:13:16 +0000
Message-ID: <1362568433.21850.31.camel@sauron>
Subject: Re: [PATCH V2 1/3] mtd: bcm47xxsflash: keep a reference to the BCMA
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 06 Mar 2013 13:13:53 +0200
In-Reply-To: <CACna6ryh0Ko3edT_dSHcP6U21rmxAuHgc--Y=sK5e=z2pVPCmg@mail.gmail.com>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
 <1362568069.21850.28.camel@sauron>
 <CACna6ryh0Ko3edT_dSHcP6U21rmxAuHgc--Y=sK5e=z2pVPCmg@mail.gmail.com>
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

On Wed, 2013-03-06 at 12:08 +0100, Rafał Miłecki wrote:
> 2013/3/6 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Wed, 2013-03-06 at 12:01 +0100, Rafał Miłecki wrote:
> >> struct bcma_drv_cc;
> >> +
> >>  struct bcm47xxsflash {
> >> +     union {
> >> +             struct bcma_drv_cc *bcma_cc;
> >> +     };
> >
> > Why union?
> 
> It's about adding support for different buses in the future (ssb) I
> was describing in the other patch.

Would be a bit cleaner to add the union when you add the second field
instead, or at least make sure you add the second field in this series. 
Otherwise how do I know if you are going to ever send a patch which
justifies the union?

-- 
Best Regards,
Artem Bityutskiy
