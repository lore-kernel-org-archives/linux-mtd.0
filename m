Received: from pacific.moreton.com.au ([203.143.235.130]
	helo=dorfl.internal.moreton.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AodOb-0001eG-3Q
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2004 06:53:53 +0000
Message-ID: <4021E898.2080901@snapgear.com>
Date: Thu, 05 Feb 2004 16:54:16 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <20040204101218.92472.qmail@web20416.mail.yahoo.com>
	<1075890631.5699.3.camel@lapdancer.baythorne.internal>
In-Reply-To: <1075890631.5699.3.camel@lapdancer.baythorne.internal>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: Roy Lauer <rlaor@yahoo.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with DOC Millennium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:
> If your mailer is broken and loses References: headers, get a real one.
> Don't just remove 'Re:' from your subject line to get around the
> filters. 
> 
> On Wed, 2004-02-04 at 02:12 -0800, Roy Lauer wrote:
> 
>>>The DiskOnChip Millennium Plus uses INFTL not NFTL.
>>
>>You should be very
>>
>>>careful using the current INFTL code -- it does not
>>
>>observe the Bad Block Table.

How did you format the DoC INFTL?
Did you use the M-Systems tools, or a modified nftl_format
under Linux?


>>What does it mean?
>>Does it mean that practically the current INFTL code
>>is unusable with the DiskOnChip Millennium Plus?
>>
>>The DOC is recognized correctly but I keep getting
>>"corrupt block" errors (please see the log below).
> 
> 
> It does indeed look like it's trying to erase blocks which are actually
> bad -- which it should have _known_ are bad if it had been able to read
> the BBT.
> 
> We really do need to implement support for reading the BBT.

I have a modified nftl_format code that reads the BBT when
doing the INFTL formating, and thus avoids the appropriate
bad blocks at format time. Now we just need the inftlmount
code to parse it as well.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a CyberGuard Company            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
