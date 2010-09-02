Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or87f-0000EA-Al
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:38:28 +0000
Received: by gxk27 with SMTP id 27so157568gxk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 04:38:26 -0700 (PDT)
Subject: Re: [RFC] [MTD-utils] mkfs.jffs2: JFFS2 and minimal erase block size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
In-Reply-To: <AANLkTinR9H7B5taVHmowOQ8Z==dQU4PdcnjLyHKPRibV@mail.gmail.com>
References: <AANLkTinR9H7B5taVHmowOQ8Z==dQU4PdcnjLyHKPRibV@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 14:38:21 +0300
Message-ID: <1283427501.3085.11.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 17:36 +0200, Yegor Yefremov wrote:
> Hello,
> 
> I'm using a NOR flash SST39VF3201. According to its data sheet the
> erase size is 2 Kword. That corresponds to -e 0x1000 value. But the
> mkfs.jffs2 utility has a limit of 0x2000 bytes. If I change this limit
> to 0x1000 and create an image, I can successfully mount and use it,
> with 8KiB value the jffs2 driver fails to work with such an image. I
> have found some similar complains like this one
> http://lists.infradead.org/pipermail/linux-mtd/2009-February/024523.html,
> but no one seems to have asked this question on the list.
> 
> Is there any reason for limiting erase block to 0x2000?
> 
> I've created a patch to decrease this value to 0x1000, but perhaps
> there are any other way?

JFFS2 should be able to fit at least one node to eraseblock. The maximum
node size is 4KiB+few bytes. This is why the minimum eraseblocks size is
8KiB.

But in practice, even 8KiB is bad because you and up with wasting a lot
of space at the end of eraseblocks.

You should join several erasblock into one virtual eraseblock of 64 or
128 KiB and use it - this will be more optiomal.

So, nack for the patch.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
