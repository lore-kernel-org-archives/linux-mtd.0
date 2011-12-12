Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaD8N-0005oQ-7Z
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:10:03 +0000
Received: by lahc1 with SMTP id c1so683717lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:10:00 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Mon, 12 Dec 2011 23:09:51 +0200
In-Reply-To: <4EDEAEB9.6020703@freescale.com>
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <4EDEAEB9.6020703@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323724195.2297.11.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-06 at 18:09 -0600, Scott Wood wrote:
> On 12/03/2011 10:31 PM, shuo.liu@freescale.com wrote:
> > From: Liu Shuo <shuo.liu@freescale.com>
> > 
> > Freescale FCM controller has a 2K size limitation of buffer RAM. In order
> > to support the Nand flash chip whose page size is larger than 2K bytes,
> > we read/write 2k data repeatedly by issuing FIR_OP_RB/FIR_OP_WB and save
> > them to a large buffer.
> > 
> > Signed-off-by: Liu Shuo <shuo.liu@freescale.com>
> > ---
> > v3:
> >     -remove page_size of struct fsl_elbc_mtd.
> >     -do a oob write by NAND_CMD_RNDIN. 
> > 
> >  drivers/mtd/nand/fsl_elbc_nand.c |  243 ++++++++++++++++++++++++++++++++++----
> >  1 files changed, 218 insertions(+), 25 deletions(-)
> 
> What is the plan for bad block marker migration?

Why it should be migrated? I thought that you support 2KiB pages, and
this adds 4 and 8 KiB pages support, which you never supported before.
What is the migration you guys are talking about?

Artem.
