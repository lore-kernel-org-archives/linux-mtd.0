Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt14k-0002e8-4L
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 21:21:39 +0000
Received: by mail-vc0-f181.google.com with SMTP id le20so4466277vcb.40
 for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2014 13:21:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <006d01d00826$fa33c2a0$ee9b47e0$@TelosAlliance.com>
References: <006d01d00826$fa33c2a0$ee9b47e0$@TelosAlliance.com>
Date: Mon, 24 Nov 2014 22:21:16 +0100
Message-ID: <CAFLxGvyV0VYtQSWdnKJDs2choDMYGbR3azajXjd1ut4Emw1KdQ@mail.gmail.com>
Subject: Re: Read-only file systems using NAND/MTD
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Rod Campbell <rod.campbell@telosalliance.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 24, 2014 at 9:41 PM, Rod Campbell
<rod.campbell@telosalliance.com> wrote:
> Hello,
>
> Is there an update about implementing a read-only file system on NAND?  The
> most recent discussion I could find was from May 2012:
>
> http://lists.infradead.org/pipermail/linux-mtd/2012-May/041200.html
>
> The conclusion seemed to be to use ubi underneath something like squashfs to
> provide bad-block awareness.  Is this still the recommended solution?

Yes. Using the new UBI block driver this is trivial.

-- 
Thanks,
//richard
