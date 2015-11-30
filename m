Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3MHx-0003ug-Kt
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 11:06:34 +0000
Received: by wmec201 with SMTP id c201so132843531wme.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 03:06:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2F27BCDE355D444CB7EA7E1569D84650289D6DDD@ESESSMB203.ericsson.se>
References: <2F27BCDE355D444CB7EA7E1569D84650289D6DDD@ESESSMB203.ericsson.se>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 30 Nov 2015 12:05:32 +0100
Message-ID: <CAOMqctRqou0U0Brx09GHYPoY71Bfv0WcJUBkPFxJCLpMVg8qKQ@mail.gmail.com>
Subject: Re: UBIFS node magic number off by single zero-byte
To: Goran Cengic <goran.cengic@ericsson.com>
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

Hello,

On 30 November 2015 at 11:46, Goran Cengic <goran.cengic@ericsson.com> wrote:
> Hi all,
>
> I've encountered a peculiar issue with the UBIFS failing to mount because of an unclean node.
> UBIFS complains that the node is unclean since it can't find the magic number,
> however in the bytes dumped I can see that the magic number is there except that it is offset
> by a single zero-byte. Here is the log:

Did you try some stress-testing of the controller?

I don't know what your hardware setup looks like. I had some problems
with extra bytes when a DMA transfer failed and buffers were not
properly flushed on my SPI controller or the DMA transfer was just
programmed incorrectly. Not sure about the exact cause yet.

Thanks

Michal
