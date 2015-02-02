Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YICte-0002Tb-VS
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 09:02:20 +0000
Date: Mon, 2 Feb 2015 10:01:51 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: avoid registering reboot notifier twice
In-Reply-To: <54CF2261.1040707@flawful.org>
Message-ID: <alpine.DEB.2.02.1502020958310.11532@lnxricardw1.se.axis.com>
References: <1422752930-696-1-git-send-email-nks@flawful.org>
 <20150201230723.GA3523@norris-Latitude-E6410> <54CF2261.1040707@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Niklas Cassel <nks@flawful.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 02/02/2015 12:07 AM, Brian Norris wrote:
> >
> > No driver should be calling mtd_device_parse_register() multiple times
> > on the same mtd_info. Under what context do you see this? What driver?
> arch/cris/arch-v32/drivers/axisflashmap.c

Looking at it another way, why should it not be allowed, if the only 
thing stopping it from working is Niklas' fix below? If there are multiple 
ways a driver can acquire partitioning information, it is handy to be able 
to do mtd_device_parse_register() several times, rather than collecting 
all the partitioning information in one place and doing the call there, 
which I suppose would be the alternative.

I've noted that mtd/nand/diskonchip.c does it too:

        mtd_device_register(mtd, NULL, 0);
        if (!no_autopart)
                mtd_device_register(mtd, parts, numparts);

but this driver might be essentially deprecated, I don't know.

> >> Signed-off-by: Niklas Cassel <nks@flawful.org>
> >> ---
> >>  drivers/mtd/mtdcore.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> >> index de79576..98efc1e 100644
> >> --- a/drivers/mtd/mtdcore.c
> >> +++ b/drivers/mtd/mtdcore.c
> >> @@ -556,7 +556,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
> >>  			err = -ENODEV;
> >>  	}
> >>  
> >> -	if (mtd->_reboot) {
> >> +	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
> >>  		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
> >>  		register_reboot_notifier(&mtd->reboot_notifier);
> >>  	}

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
