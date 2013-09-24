Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOaS1-0005re-5A
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 21:47:21 +0000
Date: Tue, 24 Sep 2013 18:46:54 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org
Subject: Setting NAND timings parameters (Re: [RFC/PATCH v2] mtd: nand:
 pxa3xx: Remove redundant device probing)
Message-ID: <20130924214653.GA2376@localhost>
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
 haojian.zhuang@gmail.com, Daniel Mack <zonque@gmail.com>, b32955@freescale.com,
 matthieu.castet@parrot.com,
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
> > 
> > Right. However, since we can easily add support to configure every controller
> > parameter (right?) this shouldn't be a problem.
> > 
> > What do you think of this change, Daniel?
> 
> I always thought that this detail of the pxa nand driver is ugly :) But
> I'd say before it can be merged, you need to provide code to set the
> timing from parameters obtained from generic part. Are you working on
> this? I'd happily test more patches.
> 

Returning to this point: it seems we have two different cases: ONFI-compliant
devices and non-ONFI.

For the ONFI, we can have a timings parameter table with some index according
to the ONFI timing mode available or user-selected. This table could be
generic (as in Matthieu Castet patch [1]) or driver specific (as in
denali driver).

For the non-ONFI, we could just add platform data / device-tree bindings
to allow to user to set the timings.

[1] http://patchwork.ozlabs.org/patch/197506/

How does this sound?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
