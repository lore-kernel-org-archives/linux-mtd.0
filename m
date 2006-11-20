Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm7uD-00039S-Sb
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 07:05:52 -0500
Message-ID: <45619A14.1010001@ru.mvista.com>
Date: Mon, 20 Nov 2006 15:05:40 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: kbaidarov <kbaidarov@dev.rtsoft.ru>
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
References: <20061117184055.569da7ad@localhost.localdomain>
In-Reply-To: <20061117184055.569da7ad@localhost.localdomain>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kbaidarov wrote:
> Description:
> The following patch adds readonly block device layer over mtd
> that allows to use any filesystem on this device in RO mode and
> thus gain faster mount times and better throughput rates.
>
> How it works:
> Blocks translation routine was added to read sector function. Assuming
> that bad block won't appear during MTD reading and BBT is correct, bad
> block is skipped and requested block is lazily mapped to good one.
> Block driver based on the mtd readonly device driver mtdblock_ro.c and
> translation routine was taken from the patch of Pantelis Antoniou
> (which can be found at
> http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html).
>
> Large major 258 has already been assigned by LANANA.
>
> Signed-off-by: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
>   

Acked-by: Vitaly Wool <vwool@ru.mvista.com> ;-)
