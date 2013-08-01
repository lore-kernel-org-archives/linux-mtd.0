Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4qQg-0003dF-Rg
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 10:48:23 +0000
Received: by mail-wg0-f41.google.com with SMTP id n11so5732071wgh.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2013 03:47:59 -0700 (PDT)
Message-ID: <51FA3CDC.7040408@gmail.com>
Date: Thu, 01 Aug 2013 12:47:56 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51FA357B.9000804@gmail.com> <20130801102119.GA2410@localhost>
In-Reply-To: <20130801102119.GA2410@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Gregory Clement <gregory.clement@free-electrons.com>,
 eric.miao@marvell.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>,
 nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01.08.2013 12:21, Ezequiel Garcia wrote:
> Probably one of the patches is wrong. Could you do a git-bisect?

Sure:

fbd70cb71103051699c7c49b08d5e107736e3a75 is the first bad commit
commit fbd70cb71103051699c7c49b08d5e107736e3a75
Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date:   Mon Jul 29 20:24:13 2013 -0300

    mtd: nand: pxa3xx: Support command buffer #3

    Some newer controllers support a fourth command buffer. This additional
    command buffer allows to set an arbitrary length count, using the
    NDCB3.NDLENCNT field, to perform non-standard length operations
    such as the ONFI parameter page read.

    In controllers without this register, the operation has no effect.

    Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>


With this patch reverted, things are fine again on PXA3xx.


Daniel
