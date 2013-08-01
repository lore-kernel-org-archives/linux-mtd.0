Received: from up.free-electrons.com ([94.23.35.102]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4qbo-0003n0-2L
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 10:59:53 +0000
Date: Thu, 1 Aug 2013 07:59:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
Message-ID: <20130801105921.GB2410@localhost>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51FA357B.9000804@gmail.com> <20130801102119.GA2410@localhost>
 <51FA3CDC.7040408@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51FA3CDC.7040408@gmail.com>
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

On Thu, Aug 01, 2013 at 12:47:56PM +0200, Daniel Mack wrote:
> On 01.08.2013 12:21, Ezequiel Garcia wrote:
> > Probably one of the patches is wrong. Could you do a git-bisect?
> 
> Sure:
> 

Thanks a lot!

> fbd70cb71103051699c7c49b08d5e107736e3a75 is the first bad commit
> commit fbd70cb71103051699c7c49b08d5e107736e3a75
> Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Date:   Mon Jul 29 20:24:13 2013 -0300
> 
>     mtd: nand: pxa3xx: Support command buffer #3
> 
>     Some newer controllers support a fourth command buffer. This additional
>     command buffer allows to set an arbitrary length count, using the
>     NDCB3.NDLENCNT field, to perform non-standard length operations
>     such as the ONFI parameter page read.
> 
>     In controllers without this register, the operation has no effect.

^^^
So the above does not hold :-(

Given this shows a significant distinction between PXA NAND controller
(what we could call NFCv1) and Armada 370/XP NAND controller (NFCv2)
I see no way but to introduce a new compatible string for this driver.

Following the convention of choosing the first SoC that introduces the
controller, the new compatible would be "marvell,armada370-nand".

How does this sound?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
