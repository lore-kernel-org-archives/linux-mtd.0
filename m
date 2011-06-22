Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZL6f-0005mK-Nh
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 10:56:26 +0000
Received: by pvg20 with SMTP id 20so426895pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 03:56:21 -0700 (PDT)
Subject: RE: [PATCH upstream] nand: nand_base: Always initialise oob_poi
	before writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
Date: Wed, 22 Jun 2011 13:57:04 +0300
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DD8D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308722112.18119.36.camel@sauron>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DD8D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308740228.18119.70.camel@sauron>
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

On Wed, 2011-06-22 at 12:41 +0200, THOMSON, Adam (Adam) wrote:
> Artem Wrote:
> 
> >
> > Added the -stable CC here and pushed to l2-mtd-2.6.git with
> > some modifications.
> >
> 
> This is probably my fault, but the mail previous to this had the
> version which contained the stable line.

I did not figure out why you sent 2 separate patches. Usually it is one
patch which goes upstream, then GregKH and others pick it up and back
ports to various stable trees. If they have issues, they may come and
ask for help. So there should be 1 patch.

>  That patch version (v3)did
> not remove the final memset from nand_do_write_oob, as you requested.

Did I request so? I thought I just expressed a thought that the memset
is redundant and should be killed, and I thought you'd take a deeper
look and decide whether it is safe to do or not.

> Named both patches the same as they were pretty much indentical,
> except for the memset. Didn't know the convention for patch naming
> where one was going to stable, and the other to the latest so
> marked the latest as upstream to differentiate.

So do we need that memset or not? :-)

-- 
Best Regards,
Artem Bityutskiy
