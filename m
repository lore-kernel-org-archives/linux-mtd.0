Received: from mail-bk0-x233.google.com ([2a00:1450:4008:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72UP-0006HN-6K
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:05:17 +0000
Received: by mail-bk0-f51.google.com with SMTP id mx10so221168bkb.10
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2013 05:04:55 -0700 (PDT)
Message-ID: <520237E3.4020805@gmail.com>
Date: Wed, 07 Aug 2013 14:04:51 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51FA357B.9000804@gmail.com> <20130801102119.GA2410@localhost>
 <51FA3CDC.7040408@gmail.com> <20130801105921.GB2410@localhost>
In-Reply-To: <20130801105921.GB2410@localhost>
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

Hi Ezequiel,

On 01.08.2013 12:59, Ezequiel Garcia wrote:
> On Thu, Aug 01, 2013 at 12:47:56PM +0200, Daniel Mack wrote:

>> fbd70cb71103051699c7c49b08d5e107736e3a75 is the first bad commit
>> commit fbd70cb71103051699c7c49b08d5e107736e3a75
>> Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>> Date:   Mon Jul 29 20:24:13 2013 -0300
>>
>>     mtd: nand: pxa3xx: Support command buffer #3
>>
>>     Some newer controllers support a fourth command buffer. This additional
>>     command buffer allows to set an arbitrary length count, using the
>>     NDCB3.NDLENCNT field, to perform non-standard length operations
>>     such as the ONFI parameter page read.
>>
>>     In controllers without this register, the operation has no effect.
> 
> ^^^
> So the above does not hold :-(
> 
> Given this shows a significant distinction between PXA NAND controller
> (what we could call NFCv1) and Armada 370/XP NAND controller (NFCv2)
> I see no way but to introduce a new compatible string for this driver.
> 
> Following the convention of choosing the first SoC that introduces the
> controller, the new compatible would be "marvell,armada370-nand".
> 
> How does this sound?
> 

Are you planning a new version of this series? I'd like to base my
pxa-dma patches on top of yours ...


Thanks,
Daniel
