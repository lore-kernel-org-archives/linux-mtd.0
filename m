Received: from mail-bn3nam01on0095.outbound.protection.outlook.com
 ([104.47.33.95] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYIPo-0005yq-1Q
 for linux-mtd@lists.infradead.org; Fri, 12 Aug 2016 19:46:49 +0000
Date: Fri, 12 Aug 2016 14:47:29 -0500
From: Kyle Roeschley <kyle.roeschley@ni.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <beanhuo@micron.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nathan.sullivan@ni.com>,
 <xander.huff@ni.com>, <peterpansjtu@gmail.com>
Subject: Re: [PATCH v6 1/2] mtd: nand_bbt: Move BBT block selection logic out
 of write_bbt()
Message-ID: <20160812194729.GA16998@senary>
References: <1471024490-32348-1-git-send-email-kyle.roeschley@ni.com>
 <20160812211503.484e3553@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20160812211503.484e3553@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Aug 12, 2016 at 09:15:03PM +0200, Boris Brezillon wrote:
> Hi Kyle,
> 
> On Fri, 12 Aug 2016 12:54:49 -0500
> Kyle Roeschley <kyle.roeschley@ni.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> > This clarifies the write_bbt() by removing the write label and clarifying
> > the error/exit path.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Just want to make sure you actually tested those patches, because I
> didn't :).
> 
> Can you add your Tested-by on this one and confirm you've tested patch
> 2 as well.

Whoops, I goofed and only tested with both patches applied. Thanks for the
catch. I'll go ahead and test the first alone and submit a v7.

Regards,

-- 
Kyle Roeschley
Software Engineer
National Instruments
