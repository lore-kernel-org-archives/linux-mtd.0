Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pwdsq-0003Nb-Sl
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 17:06:13 +0000
Date: Mon, 7 Mar 2011 18:06:14 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Message-ID: <20110307180614.48365956@wker>
In-Reply-To: <1299505896.27552.0.camel@koala>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1299497990.2746.31.camel@localhost> <20110307140554.13ff94aa@wker>
	<1299505896.27552.0.camel@koala>
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

On Mon, 07 Mar 2011 15:51:36 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:
...
> > Yes, together with both patches from
> > "[PATCH 0/2] Further fixes for UBIFS recovery on CFI NOR" series
> > these patches fix UBIFS recovery issues on our NOR flash. Remaining
> > issue seems to be CRC-Error due to unstable bits in UBIFS data node.
> 
> OK, thanks, then I think they should be merged.
> 
> WRT unstable bits - are you planning to invest any time into that issue?

Currently not, I'm busy on another project now.

Anatolij
