Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlvSU-0003Ek-PW
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 07:56:51 +0000
Received: by mail-pa0-f48.google.com with SMTP id ey11so266013pad.35
 for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2014 23:56:29 -0800 (PST)
Date: Tue, 4 Nov 2014 23:56:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH v1 1/2] devicetree: bindings: improve description for
 GPIO assisted NAND flash
Message-ID: <20141105075625.GB22361@norris-Latitude-E6410>
References: <1407227846-3257-1-git-send-email-gsi@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407227846-3257-1-git-send-email-gsi@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Alexander Shiyan <shc_work@mail.ru>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Mike Rapoport <mike@compulab.co.il>,
 Jamie Iles <jamie@jamieiles.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 05, 2014 at 10:37:25AM +0200, Gerhard Sittig wrote:
> Expand the description of the 'gpios' property in the GPIO assisted
> NAND flash binding, to explicitly list the required GPIO pin references
> and their order.
> 
> Update the example section to individually bracket the GPIO references,
> and capitalize the signal names for improved readability.
> 
> Signed-off-by: Gerhard Sittig <gsi@denx.de>

Applied both to l2-mtd.git.

Brian
