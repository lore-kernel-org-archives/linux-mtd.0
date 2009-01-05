Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJw9g-0003Tu-Ns
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 20:34:33 +0000
Message-ID: <49626E1E.1040408@freescale.com>
Date: Mon, 05 Jan 2009 14:31:26 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Nishanth Menon <menon.nishanth@gmail.com>
Subject: Re: nand_default_bbt and x8 large page nand devices
References: <782515bb0901051227k7c8b8a13o13016f0178058bf@mail.gmail.com>
In-Reply-To: <782515bb0901051227k7c8b8a13o13016f0178058bf@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, maragani2000@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nishanth Menon wrote:
> I guess the real question could be: is this a bug in reality? Do all x8 large
> page devices expect 1 byte bb marker or is it just micron?

It's not so much a bug as just a wasted byte -- any good block should 
contain all FFs from the factory, so unless software chooses to use it 
for something else (or the controller insists on putting ECC there) it 
should be harmless to treat the bad block marker as if it were two bytes.

-Scott
