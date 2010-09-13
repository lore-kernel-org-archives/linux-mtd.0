Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov9kA-00035c-At
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 14:10:50 +0000
Received: by gwj21 with SMTP id 21so2502187gwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 07:10:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3850A844E6A3854C827AC5C0BEC7B60A1FC158@zch01exm23.fsl.freescale.net>
References: <1284027632-32573-1-git-send-email-tie-fei.zang@freescale.com>
	<1284027632-32573-2-git-send-email-tie-fei.zang@freescale.com>
	<1284027632-32573-3-git-send-email-tie-fei.zang@freescale.com>
	<20100909114153.GB6622@oksana.dev.rtsoft.ru>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC158@zch01exm23.fsl.freescale.net>
From: Timur Tabi <timur.tabi@gmail.com>
Date: Mon, 13 Sep 2010 09:10:15 -0500
Message-ID: <AANLkTimfKwdw+nLAjDjxf52dbZKLF-3aES+bT7CHskAS@mail.gmail.com>
Subject: Re: [PATCH v2 3/3][MTD] P4080/mtd: Fix the freescale lbc issue with
	36bit mode
To: Zang Roy-R61911 <r61911@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Anton Vorontsov <cbouatmailru@gmail.com>,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 13, 2010 at 2:30 AM, Zang Roy-R61911 <r61911@freescale.com> wrote:

> What is the different for unsigned int and u32? I think they are same.

Roy, please don't ever write code that assumes that sizeof(int) == 4.
There's a reason why we have unsized integer types (like int, long,
and short) and sized integer types (like u8, u16, u32).  If you want
an integer of a specific size, you should use a sized integer type.

-- 
Timur Tabi
Linux kernel developer at Freescale
