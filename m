Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDxHI-0001ur-C2
 for linux-mtd@lists.infradead.org; Fri, 08 Mar 2013 13:24:05 +0000
Message-ID: <1362749090.5101.7.camel@sauron.fi.intel.com>
Subject: Re: NAND subpage write support interface
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Fri, 08 Mar 2013 15:24:50 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E99AFBE@DBDE01.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73E99AFBE@DBDE01.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-28 at 06:41 +0000, Gupta, Pekon wrote:
> Hi All,
> 
> Need a suggestion, based on my understanding of following flow in NAND driver:
> 
> MTD Writes: (Currently implemented)
> nand_write [Interface]
>     +-- nand_do_write_ops  [Internal]
>               +-- chip->write_page   [Replacable]
>                         +-- chip->ecc.write_page_raw  [Replaceable]
>                         +-- chip->ecc.write_page [Replaceable]
> 
> 
> MTD Read: (Currently implemented)
> nand_read [Interface]
>     +-- nand_do_read_ops  [Internal]
>                 +-- chip->ecc.read_page_raw  [Replaceable]
>                 +-- chip->ecc.read_subpage [Replaceable]
>                 +-- chip->ecc.write_page [Replaceable]

I guess you meant 'read_page' here.

> My queries: 
>  (1) Going forward, Can the MLC and SLC programming sequence be merged 
> In generic 'nand_do_write_ops' ? 
> And 'chip->write_page' interface can be deprecated?
> Currently I do not see any driver  except 'lpc32xx_mlc.c' using this interface. 

Probably, do  you have a patch? 
> 
> --------------------------------------------------
> 
> MTD Writes: (with deprecated chip->write_page interface)
> nand_write [Interface]
>     +-- nand_do_write_ops  [Internal]
>                +-- chip->ecc.write_page_raw  [Replaceable]
>                +-- chip->ecc.write_page [Replaceable]
> 
> --------------------------------------------------
> 
> 
>  (2) To add support for NAND subpage writes, I need to pass 'column' offset 
> also till chip->ecc.nand_subpage_write. So I need to either update existing 
> 'chip->write_page' interface,  
> OR add a new interface 'chip->write_subpage' in parallel.

I guess 'write_subpage' is reasonable.



-- 
Best Regards,
Artem Bityutskiy
