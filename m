Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAvCb-0007DH-16
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 07:48:18 +0000
Subject: Re: Corrupt Empty Space Error at Runtime
To: Sheng Yong <shengyong1@huawei.com>, Adam <aps337@gmail.com>
References: <CAHW51sUEt+3mxWE-pLdLvk_xmfuPdjSKTnGi2pBzbEK7CoUFRw@mail.gmail.com>
 <CAFLxGvzNPJQsae-JW_5KabJyDCh2aRKOC3mCWeH5JAboji1gCA@mail.gmail.com>
 <56775906.2040506@huawei.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5677AEA3.7010208@nod.at>
Date: Mon, 21 Dec 2015 08:47:47 +0100
MIME-Version: 1.0
In-Reply-To: <56775906.2040506@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 21.12.2015 um 02:42 schrieb Sheng Yong:
> We have met several empty space corruptions these days, since the ECC
> functionality of the NAND controller driver seems not work correctly.
> But we are still considering if there is any workaroud to let UBIFS
> check if the corruption occurs really in empty space. If it is, UBIFS
> should recover the LEB.
> 
> There are 2 conditions we may check:
> 1. the left space size is less than the min size of a node, it must be
>    empty space;
> 2. how many bits are fliped in left space, if they are less than 4 bits
>    (many NAND support 1~4 bits ECC), it should be in empty space;

Please consider fixing the driver first.
We also have patches for gpmi. Maybe we can find a common way
to fix this clearly within MTD without weakening UBIFS.

Thanks,
//richard
