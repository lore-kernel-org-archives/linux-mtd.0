Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72iA-0006YU-AH
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:19:30 +0000
Date: Wed, 7 Aug 2013 09:18:59 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
Message-ID: <20130807121858.GA2383@localhost>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51FA357B.9000804@gmail.com> <20130801102119.GA2410@localhost>
 <51FA3CDC.7040408@gmail.com> <20130801105921.GB2410@localhost>
 <520237E3.4020805@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <520237E3.4020805@gmail.com>
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

On Wed, Aug 07, 2013 at 02:04:51PM +0200, Daniel Mack wrote:
> Hi Ezequiel,
> 
> On 01.08.2013 12:59, Ezequiel Garcia wrote:
> > On Thu, Aug 01, 2013 at 12:47:56PM +0200, Daniel Mack wrote:
> 
> >> fbd70cb71103051699c7c49b08d5e107736e3a75 is the first bad commit
> >> commit fbd70cb71103051699c7c49b08d5e107736e3a75
> >> Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> >> Date:   Mon Jul 29 20:24:13 2013 -0300
> >>
> >>     mtd: nand: pxa3xx: Support command buffer #3
> >>
> >>     Some newer controllers support a fourth command buffer. This additional
> >>     command buffer allows to set an arbitrary length count, using the
> >>     NDCB3.NDLENCNT field, to perform non-standard length operations
> >>     such as the ONFI parameter page read.
> >>
> >>     In controllers without this register, the operation has no effect.
> > 
> > ^^^
> > So the above does not hold :-(
> > 
> > Given this shows a significant distinction between PXA NAND controller
> > (what we could call NFCv1) and Armada 370/XP NAND controller (NFCv2)
> > I see no way but to introduce a new compatible string for this driver.
> > 
> > Following the convention of choosing the first SoC that introduces the
> > controller, the new compatible would be "marvell,armada370-nand".
> > 
> > How does this sound?
> > 
> 
> Are you planning a new version of this series? I'd like to base my
> pxa-dma patches on top of yours ...
> 
> 

Yes, I was just about to send it.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
