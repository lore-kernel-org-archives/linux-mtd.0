Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pwa8I-0001UO-Ds
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 13:05:55 +0000
Date: Mon, 7 Mar 2011 14:05:54 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Message-ID: <20110307140554.13ff94aa@wker>
In-Reply-To: <1299497990.2746.31.camel@localhost>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1299497990.2746.31.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 07 Mar 2011 13:39:50 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Sun, 2011-02-06 at 15:17 +0200, Artem Bityutskiy wrote:
> > Hi,
> > 
> > here is a better patch for recovery fix. Comparing to the previous
> > patch-set now we make sure we keep write-buffer offset aligned to
> > @c->max_write_size (64 in case of CFI NOR) as much as possible.
> > 
> > Also, I've merged the "Add comments" patch with the patch which adds
> > the code.
> > 
> > You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
> > branch:
> > git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2
> > 
> > Please, test. These patches may break NAND setups as well, so anyone
> > who is interested in having stable UBIFS in the next release, please,
> > also test.
> 
> Anatolij,
> 
> did these patches fix your issues. I know you found another one related
> to unstable bits, but it is a separate issue. I need to make a decision
> whether my patches go upstream the next merge window or they should
> wait.
> 
> I have v3 of the patches, but they are not very different from v2. I
> will send them out as well.

Hi Artem,

Yes, together with both patches from
"[PATCH 0/2] Further fixes for UBIFS recovery on CFI NOR" series
these patches fix UBIFS recovery issues on our NOR flash. Remaining
issue seems to be CRC-Error due to unstable bits in UBIFS data node.

Best regards,
Anatolij
