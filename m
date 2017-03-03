Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjltU-0004mW-2Q
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 12:01:11 +0000
Message-ID: <1488542438.3583.107.camel@gmail.com>
Subject: Re: [PATCH 0/3] ubifs: add lz4hc compression
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Hyunchul Lee <hyc.lee@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, kernel-team@lge.com
Date: Fri, 03 Mar 2017 14:00:38 +0200
In-Reply-To: <58B94E55.3080209@gmail.com>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
 <5766cc86-d4cc-230c-9d3c-073d9b8d6ec5@nod.at> <58B94E55.3080209@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2017-03-03 at 20:07 +0900, Hyunchul Lee wrote:
> yes, ubifs detects this. but I mean that if another compression type
> except lz4hc
> is added, ubifs cannot. because ubifs_iget() assigns ubifs_ino_node's
> compr_type(16-bit) 
> to ubifs_inode's compr_type(2-bit).
> I guess that the disk format version should be incremented.

Let's say that some day in the future you add the new XYZ compression
support, and its type is 5. Let's say the new compressor is supported
in kernel version 5.0.

Now I get your device which is running kernel 5.0 and uses XYZ
compression. I downgrade the kernel to version 4.0 on this device, v4.0
does not support XYZ. What happens?

Well, not a very good thing. UBIFS will read the inode, truncate
compr_type in ubifs_iget():

        ui->compr_type  = le16_to_cpu(ino->compr_type);

and happily continue, and later on failing to decompress.

Is this ideal? No. But we can lessen the future problem by making
compr_type to be full u16 already today.

Should we change on-flash format? I think no, because UBIFS will still
fail when it tries to decompress.

Artem.
