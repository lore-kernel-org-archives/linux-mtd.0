Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmVSd-0002QB-LJ
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 18:05:16 +0000
Date: Mon, 7 Feb 2011 19:06:05 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Message-ID: <20110207190605.08a62a23@wker>
In-Reply-To: <1297097939.5938.26.camel@localhost>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<20110207172523.11294ec5@wker> <1297097939.5938.26.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Holger Brunck <holger.brunck@keymile.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Detlev Zundel <dzu@denx.de>, Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 07 Feb 2011 18:58:59 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Mon, 2011-02-07 at 17:25 +0100, Anatolij Gustschin wrote:
> > I dropped the lines containing ffffffff in the dump above (verified
> > that these were all ffffffff).
> > 
> > The UBIFS data node before the dumped area seems to be okay
> > and contains "ABC123ABC123ABC123..." data block.
> > 
> > The corrupted area seems to contain data from an interrupted
> > write operation. 
> 
> It looks like I missed the no_more_nodes() function. I think this should
> fix the issue you have found. If you still have the flash which ubifs
> refuses to mount, you can apply this patch, and ubifs should mount that
> media.

I did a dump of the corrupted flash and now re-flashed it and
tested with this patch. This patch doesn't help. The debug log
produced while mounting looks similar.

Thanks,
Anatolij
