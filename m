Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWw2G-0003iP-0h
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 22:27:16 +0000
Date: Thu, 17 Oct 2013 19:27:03 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 05/21] mtd: nand: pxa3xx: Add driver-specific ECC BCH
 support
Message-ID: <20131017222702.GA2485@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1379606505-2529-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131003002440.GY23337@ld-irv-0074.broadcom.com>
 <20131004194923.GC20476@localhost>
 <20131005002713.GA23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131005002713.GA23337@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Fri, Oct 04, 2013 at 05:27:13PM -0700, Brian Norris wrote:
[..]
> 
> Speaking of that: how do you deal with bad block markers, if your data
> is actually placed in what is traditionally the "spare area"?
> 

We currently don't deal with this :(

I'll be sending a v2 soon to address many of the issues you brought
and to re-work the ECC mode 'choice' to be safer.

I'll post the open issues in the v2 cover-letter, and this factory bad block
thing will be among them.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
