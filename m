Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuRn5-0008Nl-EE
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 13:38:31 +0000
From: Stefan Roese <sr@denx.de>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Thu, 16 Apr 2009 15:37:58 +0200
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
In-Reply-To: <fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904161537.59048.sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 April 2009, Grant Likely wrote:
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Reviewd-by: Grant Likely <grant.likely@secretlab.ca>
>
> Yup, still looks good to me.  What boards has this been tested on?

I tested this version on PPC405EX Kilauea equipped only one "standard" 
Spansion S29GL512 NOR chip. And a slightly modified version on an MPC8360 
board (kmeter1) which is equipped with the Intel P30 part mentioned in the 
bindings description. Slightly modified since this board support is not yet 
pushed upstream and currently using v2.6.28 (physmap_of.c has received minor 
modifications after 2.6.28 release).

Thanks.

Best regards,
Stefan
