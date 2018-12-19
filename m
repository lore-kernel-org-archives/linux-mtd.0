Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZgrR-00059t-J4
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 18:46:27 +0000
Date: Wed, 19 Dec 2018 19:46:06 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, "Zoltan Szubbocsev
 (zszubbocsev)" <zszubbocsev@micron.com>, Richard Weinberger
 <richard@nod.at>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Message-ID: <20181219194606.7d059723@bbrezillon>
In-Reply-To: <BYAPR08MB45331E5653451102C61BAC54DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20181219141732.3e09bdc9@bbrezillon>
 <SN6PR08MB502421AE43E6824C3CC5C1E4CBBE0@SN6PR08MB5024.namprd08.prod.outlook.com>
 <20181219151751.74931b39@xps13>
 <BYAPR08MB45331E5653451102C61BAC54DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
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

On Wed, 19 Dec 2018 17:19:43 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris and Miquel
> Thanks for your email.
> Since the patch is based on v4.2 which doesn't separate specific NAND vendor
> driver into vendor specific chip driver file. I will rebase my patch to latest linux kernel,
> and implement  a specific hook funciton in the nand_micron.c as you suggested.
> After testing well, you will see the version 2.
> 

Oops, didn't see this reply. Please ignore my previous email.
