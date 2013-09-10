Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJOpA-0006lV-Mm
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2013 14:21:49 +0000
Date: Tue, 10 Sep 2013 11:21:48 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [RFC/PATCH v2] mtd: nand: pxa3xx: Remove redundant device probing
Message-ID: <20130910142147.GA453@localhost>
References: <1378811821-14766-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1378811821-14766-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <522F22C9.1050305@gmail.com> <20130910135729.GA32715@localhost>
 <522F2941.4030406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522F2941.4030406@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 10, 2013 at 04:14:25PM +0200, Daniel Mack wrote:
[..]
> 
> I always thought that this detail of the pxa nand driver is ugly :) But
> I'd say before it can be merged, you need to provide code to set the
> timing from parameters obtained from generic part.

Agreed.

> Are you working on  this? I'd happily test more patches.
> 

Yes, I'm working on this. I'll keep on sending patches then :-)

Thanks for the test and the feedback,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
