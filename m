Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwXvl-00007C-0Z
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 11:17:05 +0000
Received: by yxk8 with SMTP id 8so1928256yxk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 04:17:03 -0700 (PDT)
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Thu, 25 Aug 2011 14:18:54 +0300
In-Reply-To: <4E53D15D.2050807@freescale.com>
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
	<4E4D3CE0.7020602@freescale.com> <4E5366AF.7040108@freescale.com>
	<4E537AC4.6000301@parrot.com> <4E53D15D.2050807@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1314271139.18988.48.camel@sauron>
Mime-Version: 1.0
Cc: Li Yang-R58472 <r58472@freescale.com>, LiuShuo <b35362@freescale.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	"linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-23 at 11:12 -0500, Scott Wood wrote:
> On 08/23/2011 05:02 AM, Matthieu CASTET wrote:
> > LiuShuo a écrit :
> >> We can't read the NOP from the ID on any chip. Some chips don't
> >> give this infomation.(e.g. Micron MT29F4G08BAC)
> 
> Are there any 4K+ chips (especially ones with insufficient NOP) that
> don't have the info?
> 
> This chip is 2K and NOP8.
> 
> Is there an easy way (without needing to have every datasheet for every
> chip ever made) to determine at runtime which chips supply this information?
> 
> > Doesn't the micron chip provide it with onfi info ?
> 
> This chip doesn't appear to be ONFI.

Few quick thoughts.

1. I think that if driver is able to detect flash NOP parameter and
refuse flashes with too low NOP, then your change is OK.
2. For ONFI flashes, can we take NOP from ONFI info?
3. For non-ONFI chip, is it fair to conclude that MLCs _all_ have NOP 1?
Can distinguish between MLC/SLC? If not, can this table help:
http://www.linux-mtd.infradead.org/nand-data/nanddata.html? If needed,
can we put "bits-per-cell" data to 'struct nand_flash_dev
nand_flash_ids' ?
4. Can we add a NOP field to 'struct nand_flash_dev nand_flash_ids'
array?

-- 
Best Regards,
Artem Bityutskiy
