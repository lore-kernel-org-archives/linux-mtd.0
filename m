Received: from smtp41.i.mail.ru ([94.100.177.101])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYtKw-0004bH-C0
 for linux-mtd@lists.infradead.org; Sat, 12 Apr 2014 08:30:56 +0000
Message-ID: <5348F99E.1070306@list.ru>
Date: Sat, 12 Apr 2014 12:30:22 +0400
From: Stas Sergeev <stsp@list.ru>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: nandwrite and contiguous space
References: <533A8749.4050802@list.ru>	<20140401182350.GS2775@book.gsilab.sittig.org>	<533B8FE1.7050408@list.ru>
 <CAFLxGvz_KQBq5zqm1zyQVgM5asW93vgQ9+CjRtDHfsSHv8ST7A@mail.gmail.com>
In-Reply-To: <CAFLxGvz_KQBq5zqm1zyQVgM5asW93vgQ9+CjRtDHfsSHv8ST7A@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------030800020006090808040304"
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030800020006090808040304
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 8bit

05.04.2014 02:00, Richard Weinberger пишет:
> On Wed, Apr 2, 2014 at 6:19 AM, Stas Sergeev <stsp@list.ru> wrote:
>> 01.04.2014 22:23, Gerhard Sittig пишет:
>>> If you want a sequence of good blocks, this very much sounds like
>>>
>>> the LEBs which UBI provides.  Aren't you asking for an UBI
>>> volume?  What am I missing?
>> Is is possible to configure ubi leb size to be multiple
>> physically contiguous eraseblocks? With some googling
>> it seems not, or what am I missing?
> No, this is not possible.
OK so I patched nandwrite.
The patch is attached only for the preliminary review or
if someone wants to help me with testing this.
The problem is that I don't know how to even test it.
What tool should I use to mark blocks as bad, test
the patch, and then unmark the blocks back to good?

--------------030800020006090808040304
Content-Type: application/gzip;
 name="nandpatch.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="nandpatch.tar.gz"

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
--------------030800020006090808040304--
