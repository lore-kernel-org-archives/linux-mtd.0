Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZfBl-0005Z7-3e
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 08:23:02 +0000
Received: by pzk28 with SMTP id 28so1124976pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 01:22:08 -0700 (PDT)
Subject: RE: [PATCH upstream] nand: nand_base: Always initialise oob_poi
	before writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
Date: Thu, 23 Jun 2011 11:22:53 +0300
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DF22@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308722112.18119.36.camel@sauron>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DD8D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308740228.18119.70.camel@sauron>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DDB3@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DF22@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308817376.18119.94.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-22 at 17:40 +0200, THOMSON, Adam (Adam) wrote:
> Adam Thomson Wrote:
> > 
> > The original request was for a stable patch, and that would 
> > be accepted if I provided a proper tidy fix also. To be fair 
> > it was a few weeks ago now that that mail was sent. :-) 
> > Anyway, as it turns out the tidy fix was almost identical, 
> > and we don't need the memset as far as I can tell from 
> > reviewing code and from testing. Will run up your patch today 
> > to verify your additional change, but should be fine.
> > 
> 
> Have tested the updated patch on hardware, and all seems good.
> No problems with OOB corruption, and mtd tests run without failure.

Thank you!

-- 
Best Regards,
Artem Bityutskiy
