Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDiVD-0002S9-4r
 for linux-mtd@lists.infradead.org; Sat, 02 Aug 2014 23:14:16 +0000
Received: by mail-vc0-f180.google.com with SMTP id ij19so8946774vcb.11
 for <linux-mtd@lists.infradead.org>; Sat, 02 Aug 2014 16:13:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53DD3A45.7000802@symeo.com>
References: <53B6DDA2.7000508@symeo.com> <53C56392.2070306@symeo.com>
 <53DD3A45.7000802@symeo.com>
Date: Sun, 3 Aug 2014 01:13:52 +0200
Message-ID: <CAFLxGvx2s0dZeRUruhQUPQAVDUrdMTFY7bPCH2-2D6Kg4Lv9bw@mail.gmail.com>
Subject: Re: Disappearing directories (jffs2 on nand flash)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Christoph Mammitzsch <Christoph.Mammitzsch@symeo.com>
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

On Sat, Aug 2, 2014 at 9:21 PM, Christoph Mammitzsch
<Christoph.Mammitzsch@symeo.com> wrote:
> Hello,
>
> I am a little astonished at the amount of feedback I got for my
> bugreport. Apparently jffs2 losing entire directories is not as big a
> deal as I thought. Does that mean that JFFS2 is dead and I should use
> another flash filesystem instead, or did I simply post on the wrong
> mailing list?

Is there any reason why you are not using UBIFS?

-- 
Thanks,
//richard
