Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MELFm-0003zd-Sg
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 10:42:08 +0000
Subject: RE: Problem in erasing a nand flash with ubiformat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Canella Matteo <Matteo.Canella@mta.it>
In-Reply-To: <BD9F3F3F5A6CCF4BA032B9FED4DD312E893B2D@mta-digimail.MTA.INT>
References: <BD9F3F3F5A6CCF4BA032B9FED4DD312E893B13@mta-digimail.MTA.INT>
	<1244622937.5847.396.camel@localhost.localdomain>
	<BD9F3F3F5A6CCF4BA032B9FED4DD312E893B2D@mta-digimail.MTA.INT>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Jun 2009 13:40:46 +0300
Message-Id: <1244630446.5847.401.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-10 at 12:01 +0200, Canella Matteo wrote:
> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind@infradead.org] 
> Sent: mercoledì 10 giugno 2009 10.36
> To: Canella Matteo
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Problem in erasing a nand flash with ubiformat
> 
> > Are you using the newest ubiformat version from the mtd-utils git
> > tree?
>  
> Ok, this is the problem.
> I'm aligned to ea429635388f7bb53f62c41ec3d5ccf5fa207370 (Mon Jan 12 11:08:03 2009) commit.
> I must get the latest version.

Yes, this is ancient code base. Update please. Also, make sure
you use the latest UBIFS. UBIFS is young, and we still fix bugs,
so always update it. We maintain back-port trees for peoples'
convenience:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
