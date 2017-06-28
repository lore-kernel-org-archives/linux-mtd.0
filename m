Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQ9Tw-0008RU-LE
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 09:41:58 +0000
Received: by mail-wm0-x244.google.com with SMTP id y5so10370223wmh.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 02:41:35 -0700 (PDT)
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>
Cc: "richard@nod.at" <richard@nod.at>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>,
 "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
 <20170627221552.6e4efff9@bbrezillon>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <07de9ec3-4ac5-2bfa-eea1-e996a4db1bba@gmail.com>
Date: Wed, 28 Jun 2017 11:41:03 +0200
MIME-Version: 1.0
In-Reply-To: <20170627221552.6e4efff9@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Boris,

On 27/06/2017 22:15, Boris Brezillon wrote:
>    
> Hm, actually I wonder if this ->prepare_op() method is really what we
> want. It seems to be here to set the proper plane number and the
> number of dummy bytes after the address cycles.
> I'd say deducing the plane from the page is something standard. Whether
> we need it or not depends on the information provide in the memorg
> object (->nplanes).
>
> Regarding the dummy byte, do you have examples of SPI NANDs requiring
> less or more dummy bytes in this read/write from/to cache use case?
> If not, I'd prefer to keep it hardcoded in the core for know, and add
> a hook when the need appears.
Here is the page read description for various devices I have:

MT29FxG01AAADD
- fetch to internal: CMD_READ (0x13) + (3 bytes page_id)
- read from internal: CMD_READ_RDM (0x03) + (2 bytes address + pane 
selection @ bit 12) + 1 dummy byte

GD5FxxQ4xC
- fetch to internal: CMD_READ (0x13) + (3 bytes page_id)
- read from internal: CMD_FAST_READ (0x0B) + 1 dummy byte + (2 bytes 
address) + 1 dummy byte

MX35LFxGE4AB
F50L1G41A
W25N01GVZEIG
- fetch to internal: CMD_READ (0x13) + (3 bytes page_id)
- read from internal: CMD_READ_RDM (0x03) + (2 bytes address) + 1 dummy byte

But you are right. It's time to have an adopted implementation for 
Micron as proposed by Peter, and we will adapt it later for others.

Arnaud
