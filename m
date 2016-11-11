Received: from smtp2-g21.free.fr ([212.27.42.2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5EHk-0003EX-0W
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2016 16:02:37 +0000
Subject: Re: [PATCH v8] mtd: nand: add tango NAND flash controller support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Sebastian Frias <sf84@laposte.net>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B37.5090100@sigmadesigns.com> <580F8407.5070706@sigmadesigns.com>
 <20161106235812.0bcbbdc5@bbrezillon>
From: Mason <slash.tmp@free.fr>
Message-ID: <5825EB70.4070406@free.fr>
Date: Fri, 11 Nov 2016 17:01:52 +0100
MIME-Version: 1.0
In-Reply-To: <20161106235812.0bcbbdc5@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/11/2016 23:58, Boris Brezillon wrote:

> Applied after fixing a few coding style issues to make checkpatch happy.

First of all, I want to thank you for all the help you provided
along the way.

I have to admit that I'm a bit frustrated by some of the changes you made
to the patch.

Specifically, changing

from:  if (ptr_expr == NULL)
  to:  if (!ptr_expr)

I dislike the second form, because it "hides" what is being tested.
I've even seen people use !count to mean count == 0, and I find that
very unintuitive.

I also have a hard time discerning a '!' after a '('


The other change is the chip->options initialization. I thought
you said on IRC I could keep my preferred formatting.


In the end, these are tiny issues in the grand scheme of things,
but it was important for me to point them out.

Regards.
