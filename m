Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUbtQ-00085G-JP
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2010 09:19:00 +0000
Date: Mon, 20 Dec 2010 10:18:51 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 6/6] UBI: use mtd->writebufsize to set minimal I/O
	unit size
Message-ID: <20101220101851.4d4f8583@wker>
In-Reply-To: <1292780779.13362.18.camel@koala>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-7-git-send-email-agust@denx.de>
	<1292780779.13362.18.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 19 Dec 2010 19:46:19 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2010-12-16 at 23:42 +0100, Anatolij Gustschin wrote:
> > Previously we used mtd->writesize field to set UBI's minimal
> > I/O unit size. This sometimes caused UBIFS recovery issues
> > when mounting an uncleanly unmounted UBIFS partition on NOR
> > flash since mtd->writesize is 1 byte for NOR flash. The
> > MTD CFI driver however often performs writing multiple
> > bytes in one programming operation using the chip's write
> > buffer. We have to use the size of this write buffer as
> > a minimal I/O unit size for UBI on NOR flash to fix the
> > observed UBIFS recovery issues.
> > 
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> 
> I've re-wrote the commentary and pushed, please, check.

Checked, it is ok. Thanks!

Anatolij
