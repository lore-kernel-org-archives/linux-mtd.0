Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfZQr-0007h3-Lg
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 05:32:07 -0400
Message-ID: <44684A39.8040404@intel.com>
Date: Mon, 15 May 2006 13:30:33 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
	<Pine.LNX.4.64.0605050949490.28543@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0605050949490.28543@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
>
> On Fri, 5 May 2006, Belyakov, Alexander wrote:
>
> > This patch adds concat_writev(), concat_writev_ecc(),
> > concat_block_isbad(), concat_block_markbad() functions to make
> > concatenation layer compatible with Sibley and NAND chips.
> >
> > The patch has been changed to use writev() functions of underlying
> > devices.
>
> From a quick glance at the writev part it looks much better than your
> former version.
>

Is there any chance to see this patch committed?

Thanks,
Alexander
