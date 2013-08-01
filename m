Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4qjH-0003zy-42
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 11:07:36 +0000
Received: by mail-wg0-f42.google.com with SMTP id j13so5747478wgh.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2013 04:07:12 -0700 (PDT)
Message-ID: <51FA4158.60200@gmail.com>
Date: Thu, 01 Aug 2013 13:07:04 +0200
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

On 01.08.2013 12:59, Ezequiel Garcia wrote:
> Given this shows a significant distinction between PXA NAND controller
> (what we could call NFCv1) and Armada 370/XP NAND controller (NFCv2)
> I see no way but to introduce a new compatible string for this driver.
> 
> Following the convention of choosing the first SoC that introduces the
> controller, the new compatible would be "marvell,armada370-nand".

Sure, that sounds about right. That's what compatibility string are for,
after all :)


Daniel
