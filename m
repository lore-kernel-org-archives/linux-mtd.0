Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxfi9-0005Wm-PV
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 13:15:26 +0000
Received: by ewy3 with SMTP id 3so551472ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 05:15:22 -0800 (PST)
Subject: Re: [PATCH/RFC v3 1/3] Shared BCH ECC library
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <4c9c56a72dda5d22f91f252f103e4ec760c913c1.1299691382.git.ivan.djelic@parrot.com>
References: <4c9c56a72dda5d22f91f252f103e4ec760c913c1.1299691382.git.ivan.djelic@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 15:13:46 +0200
Message-ID: <1299762826.6676.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-09 at 18:50 +0100, Ivan Djelic wrote:
> Hello,
> 
> The first patch of this series contains a new generic BCH ECC library.
> 
> This library can be used to provide software BCH correction on NAND devices
> (see 2nd and 3rd patch), as well as error correction for hybrid hardware BCH
> engines.
> 
> This version v3
> - improves Kconfig help description as suggested by Artem Bityutskiy
> - documents the public domain origin of a parity computation code snippet
> 
> Could you please review and comment ?
> Thanks,

I've put these patches to my l2-mtd-2.6 tree, let's see if dwmw2 merges
them. I doubt there are many people who'd wish to really review it, but
indeed the code looks good.

There are a couple of checkpatch.pl complaints for the 3rd patch, not
very important though. Also, I think nowadays we do not put file name in
the comments like you did:

+/*
+ * include/linux/bch.h
+ *

But again, not big deal. But it is better to address these tiny things,
anyway. If you re-send v4 - I'll put it to my tree instead of v3.

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
