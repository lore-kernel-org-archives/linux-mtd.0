Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGZCu-0001Tx-0C
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 22:04:12 +0000
Received: by mail-oi0-x230.google.com with SMTP id r2so133279408oih.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 15:03:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160624153307.13d1c850@crub>
References: <20160624153307.13d1c850@crub>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 25 Jun 2016 00:03:49 +0200
Message-ID: <CAFLxGvxqhE8W3K0+sS8abyq+JmSKigRWB3mzziE6LjK3DiJKWg@mail.gmail.com>
Subject: Re: Is UBI volume update broken?
To: Anatolij Gustschin <agust@denx.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2016 at 3:33 PM, Anatolij Gustschin <agust@denx.de> wrote:
> [  108.786816] UBIFS error (ubi0:0 pid 355): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 1
> [  108.796053] Not a node, first 24 bytes:
> [  108.799799] 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 00 80        UBI#...............@....

This line proves Ezequiel's thought.
You flashed an UBI image into a volume.
UBI# is the EC header magic.

-- 
Thanks,
//richard
