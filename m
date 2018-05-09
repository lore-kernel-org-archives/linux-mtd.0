Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGPdu-0003my-7C
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 14:00:41 +0000
Date: Wed, 9 May 2018 16:00:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, PACKHAM
 Chris <chris.packham@alliedtelesis.co.nz>
Subject: Re: mtd: cfi_cmdset_0002: Read data 3 times to check write
 operation status
Message-ID: <20180509160008.7079b73d@bbrezillon>
In-Reply-To: <TY1PR01MB09540E30A53D361D54CEA16EDC880@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09540E30A53D361D54CEA16EDC880@TY1PR01MB0954.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Apr 2018 05:54:43 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> Hi,
> 
> Let us consult to change mtd cfi_cmdset_0002 to read data 3 times as below patch.
> Can we change the mtd cfi_cmdset_0002 driver like this?
> If any comment or concern please let us know.
> 
> From d924822c996b9c0eccc815e5018a0c3ea6077137 Mon Sep 17 00:00:00 2001
> From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Date: Tue, 24 Apr 2018 13:26:37 +0900
> Subject: [PATCH 2/2] mtd: cfi_cmdset_0002: Read data 3 times to check write
>  operation status
> 
> Cypress S29GLxxxP flash is needed to read data 3 times to check DQ6 toggles.
> Actually the read data is sometimes changed by the 3rd reading.
> Also this is caused on other flash device also.
> The flash write failure is possible to be caused by the error.
> To resolve the issue change the read number of times to 3 from 2.

Is this patch still needed, or is [1] supposed to replace it?

[1]http://patchwork.ozlabs.org/patch/910857/
