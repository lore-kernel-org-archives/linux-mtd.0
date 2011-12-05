Received: from bitbox.plus.com ([81.174.226.42] helo=bitbox.co.uk)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RXc2O-00081w-34
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 17:09:09 +0000
Message-ID: <4EDCFAAC.90709@bitbox.co.uk>
Date: Mon, 05 Dec 2011 17:09:00 +0000
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>		
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>	
 <1323009827.9400.75.camel@sauron.fi.intel.com>	
 <4EDB89E9.6070306@newsguy.com> <1323065234.2316.2.camel@koala>
 <4EDCF840.7050107@newsguy.com>
In-Reply-To: <4EDCF840.7050107@newsguy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/12/2011 16:58, Mike Dunn wrote:
> On 12/04/2011 10:07 PM, Artem Bityutskiy wrote:
>> On Sun, 2011-12-04 at 06:55 -0800, Mike Dunn wrote:
>>> So you're thinking that the driver would supply both ecc_strength and
>>> "scrublevel" (or maybe bb_threshold)?  Would these go into struct mtd_info?
>> Probably yes. After all, UBI has no idea about what kind of flash is
>> that and what kind of ECC it uses and what bit-flip level needs
>> scrubbing. So I think this kind of information should come from the
>> driver or from the user via mtd sysfs files. What do you think?
>
>
> I'm not a flash expert, but that sounds reasonable, especially if the scrublevel
> parameter is optional, with UBI using ecc_strength as the default value.  As for
> how to pass the parameter, sysfs might be a good idea for scrublevel, allowing
> it to be tunable without having to modify the driver if experience show that the
> driver author's original assumptions about how a block degrades were incorrect.
>

Surely the check for "do we need to scrub ?" should be done lower down 
otherwise all users of the mtd NAND interface (UBI / JFFS2 etc) are 
going to have to re-implement those sysfs files and the corresponding 
checks.

P.
