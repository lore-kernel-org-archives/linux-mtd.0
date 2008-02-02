Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JLLuJ-0002fF-1h
	for linux-mtd@lists.infradead.org; Sat, 02 Feb 2008 17:12:08 +0000
Message-ID: <47A4A459.2@dave-tech.it>
Date: Sat, 02 Feb 2008 18:11:53 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: JFFS2: file contents in case of data CRC error
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
	<47A32600.9000807@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
	<20080201174332.GB14032@shareable.org>
In-Reply-To: <20080201174332.GB14032@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'm thinking the only way to detect this with high reliability is to
> store summaries of the existence of blocks in another part of storage,
> with checksums and serial numbers - like some of the latest disk
> filesystems begin to.
Can you name these file systems?


-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
