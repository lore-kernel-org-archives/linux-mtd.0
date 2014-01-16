Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3iEV-0007iF-NG
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 08:23:24 +0000
Message-ID: <1389860578.26808.90.camel@sauron.fi.intel.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Thu, 16 Jan 2014 10:22:58 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA62464@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
 <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
 <1389617894.2259.270.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA61199@DBDE04.ent.ti.com>
 <1389625608.2259.357.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA620BD@DBDE04.ent.ti.com>
 <1389856759.26808.52.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA62464@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "Stefan Roese
 <sr@denx.de> \(sr@denx.de\)" <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Calvin Johnson <linux.cj@gmail.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-01-16 at 07:44 +0000, Gupta, Pekon wrote:
> However, *assuming NAND driver can identify erased-page correctly*,
> I don't want  UBI/UBIFS to re-check the read_buf for 0xff again, because
>  underlying NAND driver has already identified as erased-page, and
> fixed the data before passing it to above MTD layer.

I would agree only if this identification costs nothing, or very little.
If for _some_ setups this would be about comparing buffers against 0xFF
for every single read - then I am so sure.

Indeed, UBIFS only needs to check for blank areas at the recovery time.
Normal reads do not need this. So _if_ there are measurable costs, I'd
argue that there is no need for people to pay it for nothing during
normal file I/O.

Hmm?

Thanks!

-- 
Best Regards,
Artem Bityutskiy
