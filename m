Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmmZm-0003XA-11
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 16:07:38 +0000
Date: Tue, 20 May 2014 13:06:38 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Message-ID: <20140520160638.GA25777@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
 <20140401111359.GA3324@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EAC31AE@DBDE04.ent.ti.com>
 <20140513005053.GZ28907@ld-irv-0074>
 <20140513022614.GA1447@arch.cereza>
 <20140519034355.GB1062@arch.cereza>
 <20140520081135.GF2413@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140520081135.GF2413@norris-Latitude-E6410>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 May 01:11 AM, Brian Norris wrote:
> On Mon, May 19, 2014 at 12:43:55AM -0300, Ezequiel Garcia wrote:
> > How about the following?
> > 
> > * corrected_bits
> > * uncorrectable_errors
> > * badblocks
> > * bbtblocks
> 
> How about we consistently separate words with underscores ('_')? So:
> 
>  * corrected_bits
>  * uncorrectable_errors
>  * bad_blocks
>  * bbt_blocks
>

Fine by me.
 
> I'm not too stuck on the naming, so other ideas are welcome.
> 

To be honest, me neither :)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
