Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR0o9-0008OA-G3
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 14:52:30 +0000
Date: Fri, 21 Mar 2014 11:51:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: gpmi: add gpmi_devdata{} to simplify the code
Message-ID: <20140321145115.GA628@arch.cereza>
References: <1395397179-17449-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4ECF@DBDE04.ent.ti.com>
 <532C15EB.9010600@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4F02@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB4F02@DBDE04.ent.ti.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 21, Gupta, Pekon wrote:
> >From: Huang Shijie [mailto:b32955@freescale.com]
[..[
> >> Can you use "compatible" string in DT for this ?
> >>
> >>
> >sorry, could you please give me an example?
> >
> >I do not know what's your meaning. :(
> >
> 
> Can you use something like this, instead of populating static for each chip.
> 
> if (of_device_is_compatible(of_node, "imx23") || of_device_is_compatible(child, "imx28")) {
> 	bch_max_ecc_strength = 20;
> 	max_chain_delay = 16;
> } elseif (of_device_is_compatible(of_node, "imx6q") {
> 	bch_max_ecc_strength = 40;
> 	max_chain_delay = 12;
> } elseif (of_device_is_compatible(of_node, "imx6sx") {
> 	bch_max_ecc_strength = 40;
> 	max_chain_delay = 0; /* whatever is here */
> } else {
> 	bch_max_ecc_strength = 1; /* whatever is default */
> 	max_chain_delay = 0; /* whatever is default */
> }
> 

IMHO, this is much more expensive, harder to maintain and less readable.

Using the compatible string to match a compatible data, and putting IP-specific
data in there (just like this patch is doing), seems like a much nicer approach.
FWIW, we are using the same trick on a few mvebu drivers.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
