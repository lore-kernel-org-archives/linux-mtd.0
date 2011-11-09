Received: from
 8.e.3.b.5.9.6.3.f.6.4.b.1.c.5.4.0.0.0.0.a.e.3.0.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:3ea:0:45c1:b46f:3695:b3e8] helo=linux-mips.org)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RO9Y4-0001PX-9s
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 14:54:48 +0000
Date: Wed, 9 Nov 2011 14:54:37 +0000
From: Ralf Baechle <ralf@linux-mips.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Subject: Re: [PATCH 14/18] MTD: nand: make au1550nd.c a platform_driver
Message-ID: <20111109145437.GN19187@linux-mips.org>
References: <1320174224-27305-1-git-send-email-manuel.lauss@googlemail.com>
 <1320174224-27305-15-git-send-email-manuel.lauss@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320174224-27305-15-git-send-email-manuel.lauss@googlemail.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 01, 2011 at 08:03:40PM +0100, Manuel Lauss wrote:

> Transform the au1550nd.c driver into a platform_driver and hook it
> up in the PB1550 board (gen_nand works fine on the DB1550, but since
> I don't have a PB1550 to test this driver stays for now).
> 
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
> ---
> Tested on the DB1550 as well.
> I'd like for this to go in via the MIPS tree if at all possible.

No (n)acks or comments received, so queued for 3.3.  Thanks,

  Ralf
