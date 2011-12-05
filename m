Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXbsR-00045R-DX
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 16:58:52 +0000
Message-ID: <4EDCF840.7050107@newsguy.com>
Date: Mon, 05 Dec 2011 08:58:40 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>		
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>	
 <1323009827.9400.75.camel@sauron.fi.intel.com>	
 <4EDB89E9.6070306@newsguy.com> <1323065234.2316.2.camel@koala>
In-Reply-To: <1323065234.2316.2.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Peter Horton <phorton@bitbox.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/04/2011 10:07 PM, Artem Bityutskiy wrote:
> On Sun, 2011-12-04 at 06:55 -0800, Mike Dunn wrote:
>> So you're thinking that the driver would supply both ecc_strength and
>> "scrublevel" (or maybe bb_threshold)?  Would these go into struct mtd_info?
> Probably yes. After all, UBI has no idea about what kind of flash is
> that and what kind of ECC it uses and what bit-flip level needs
> scrubbing. So I think this kind of information should come from the
> driver or from the user via mtd sysfs files. What do you think?


I'm not a flash expert, but that sounds reasonable, especially if the scrublevel
parameter is optional, with UBI using ecc_strength as the default value.  As for
how to pass the parameter, sysfs might be a good idea for scrublevel, allowing
it to be tunable without having to modify the driver if experience show that the
driver author's original assumptions about how a block degrades were incorrect.

Thanks,
Mike
