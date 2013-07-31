Received: from up.free-electrons.com ([94.23.35.102]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4Y9d-0002LQ-78
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 15:17:33 +0000
Date: Wed, 31 Jul 2013 12:17:01 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
Message-ID: <20130731151700.GA2347@localhost>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51F8FA24.9060904@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51F8FA24.9060904@gmail.com>
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

On Wed, Jul 31, 2013 at 01:51:00PM +0200, Daniel Mack wrote:
> On 30.07.2013 01:24, Ezequiel Garcia wrote:
> > This patchset is part of the work I'm doing to enable the pxa3xx-nand
> > driver to support the NAND controller in Armada 370/XP. While this
> > work in progress, here's a subet of patches I consider good enough
> > for mainline.
> 
> What tree did you make this patch set against? I fail to apply it on top
> of 3.11-rc3. Any particular patches I need before applying yours? Did
> you push them to any public git repository maybe?
> 

Mmm.. sorry about that, I should have been more explicit.

This patchset applies cleanly on top of a recent (yesterday or today)
linux-next and also on top Artem's l2-mtd:

git://git.infradead.org/users/dedekind/l2-mtd.git

(the above usually has the latest accepted mtd changes).

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
