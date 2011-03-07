Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwaqZ-0001ol-JD
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 13:51:40 +0000
Received: by eyh6 with SMTP id 6so1361112eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 05:51:37 -0800 (PST)
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110307140554.13ff94aa@wker>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1299497990.2746.31.camel@localhost>  <20110307140554.13ff94aa@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 15:51:36 +0200
Message-ID: <1299505896.27552.0.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-07 at 14:05 +0100, Anatolij Gustschin wrote:
> On Mon, 07 Mar 2011 13:39:50 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Sun, 2011-02-06 at 15:17 +0200, Artem Bityutskiy wrote:
> > > Hi,
> > > 
> > > here is a better patch for recovery fix. Comparing to the previous
> > > patch-set now we make sure we keep write-buffer offset aligned to
> > > @c->max_write_size (64 in case of CFI NOR) as much as possible.
> > > 
> > > Also, I've merged the "Add comments" patch with the patch which adds
> > > the code.
> > > 
> > > You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
> > > branch:
> > > git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2
> > > 
> > > Please, test. These patches may break NAND setups as well, so anyone
> > > who is interested in having stable UBIFS in the next release, please,
> > > also test.
> > 
> > Anatolij,
> > 
> > did these patches fix your issues. I know you found another one related
> > to unstable bits, but it is a separate issue. I need to make a decision
> > whether my patches go upstream the next merge window or they should
> > wait.
> > 
> > I have v3 of the patches, but they are not very different from v2. I
> > will send them out as well.
> 
> Hi Artem,
> 
> Yes, together with both patches from
> "[PATCH 0/2] Further fixes for UBIFS recovery on CFI NOR" series
> these patches fix UBIFS recovery issues on our NOR flash. Remaining
> issue seems to be CRC-Error due to unstable bits in UBIFS data node.

OK, thanks, then I think they should be merged.

WRT unstable bits - are you planning to invest any time into that issue?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
