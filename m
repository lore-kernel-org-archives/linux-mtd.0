Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZgq5-0003bc-DJ
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 18:45:03 +0000
Date: Wed, 19 Dec 2018 19:44:42 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Zoltan Szubbocsev (zszubbocsev)"
 <zszubbocsev@micron.com>, "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Message-ID: <20181219194442.0e8fafa5@bbrezillon>
In-Reply-To: <BYAPR08MB4533FD42451BCEB47D46FEEDDBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <2816846.emhzHigZ4F@blindfold>
 <BYAPR08MB4533FD42451BCEB47D46FEEDDBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

On Wed, 19 Dec 2018 18:11:25 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> "ubi: fastmap: Correctly handle interrupted erasures in EBA" patch is merged from v4.18.
> So, I still need to firstly rebase patch to latest kernel, then let's have a look.

Before you even consider porting this patch, can you please give Thomas'
patch a try (maybe after adjusting the number of blocks to overwrite and
the position of these blocks)? As Miquel said in his reply, we should
handle that at the rawnand level (nand_{base,micron}.c), not in
mtdcore.c.

Regards,

Boris
