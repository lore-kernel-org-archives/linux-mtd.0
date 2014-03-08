Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMJFP-000454-Qs
 for linux-mtd@lists.infradead.org; Sat, 08 Mar 2014 15:33:12 +0000
Received: by mail-pa0-f43.google.com with SMTP id bj1so5412671pad.16
 for <linux-mtd@lists.infradead.org>; Sat, 08 Mar 2014 07:32:50 -0800 (PST)
Date: Sun, 9 Mar 2014 02:26:30 +1100
From: Austin Boyle <boyle.austin@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Flash protection support for STmicro chips
Message-Id: <20140309022630.690bb2502ba890fdbf6eb6d9@gmail.com>
In-Reply-To: <20140305083153.GR13420@norris-Latitude-E6410>
References: <1357257748.31023.12.camel@pc786-ubu.GNET.GLOBAL.VPN>
 <528D15B6.2030800@keymile.com> <530F4CDE.7010205@keymile.com>
 <20140305081008.GP13420@norris-Latitude-E6410>
 <20140305083153.GR13420@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
 
I am very sorry I missed this discussion, that was my previous work email address. Thanks for finding me Brian!
 
> On Thu, Feb 27, 2014 at 03:34:06PM +0100, Gerlando Falauto wrote:
> > >2) While I believe this might work on m25p32, m25p64 and m25p128 (i.e.
> > >flashes with 64 blocks or more), it looks incorrect for smaller chips
> > >(namely our m25p80, with just 16 blocks). There, the 1/64 logic scales
> > >down to 1/16, e.g.
 
Gerlando, I agree that the logic for calculating the protection bits doesn't work for chips with fewer than 64 sectors. I was only testing the m25p64 at the time.

I don't think there is an issue with some bootloaders not supporting this feature, it is already optional.

It is a good idea to add another flag for flash protection to be explicitly clear which devices support this. (I previously made the assumption that writing to those status bits when unused was harmless, from the datasheets I found they seem to be don't cares.)

The following logic for calculating the block protect bits applies to the majority of the STmicro devices that support protection (m25p10, p20, p40, p80, p16, pe16, p32, p64, p128):

SR_BPs	| Protected (upper)	| Unprotected (lower)
=====================================================
0	| 0/n			| n - 0/n
1	| 1/n			| n - 1/n
2	| 2/n			| n - 2/n
3	| 3/n			| n - 4/n
4	| 4/n			| n - 8/n
5	| 5/n			| n - 16/n
6	| 6/n			| n - 32/n
7	| 7/n			| n - 64/n

Where n is number of sectors if less than 64.

Some special cases:
- m25p64 has 128 sectors but only supports protection to 64 sector resolution.
- m25p05 uses SR=1/2 for protect Block Erase, and SR=3 for protect Block Erase, Page Program, Sector Erase.
- m25px32 has an additional bit for locking the lower sections. 

A patch with this implementation follows. Let me know what you think. I have a spreadsheet summarising the block protect bits for the STmicro devices I can share if it will help.

Thanks,
Austin.
