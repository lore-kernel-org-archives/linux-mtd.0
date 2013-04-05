Received: from [2a01:4f8:101:2a4:0:bc28:b2d8:8] (helo=chuck.antcom.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UO6Bo-0005tk-IH
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2013 12:56:22 +0000
Message-ID: <515EC9EC.5030200@antcom.de>
Date: Fri, 05 Apr 2013 14:56:12 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
References: <1363352378-2825-1-git-send-email-pekon@ti.com>
 <1365088578.626.11.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9A8CE8@DBDE01.ent.ti.com>
 <1365158617.626.29.camel@sauron.fi.intel.com>
In-Reply-To: <1365158617.626.29.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/05/2013 12:43 PM, Artem Bityutskiy wrote:
> On Fri, 2013-04-05 at 09:07 +0000, Gupta, Pekon wrote:
>>  > You need to update cafe_nand.c accordingly. Aiaiai detected this:
>>>
>>> Artem Bityutskiy
>>
>> Thanks Aiaiai, Artem, 
> 
> Roland, heads up, I am going to apply this patch to the MTD tree. It
> touches your driver.

Tested-by: Roland Stigge <stigge@antcom.de>

Thanks for the note! (Sorry, haven't followed this issue.)

Works fine so far. As far as I understand it, there is only an interface
change regarding LPC32xx - subpage writing isn't officially supported by
this controller hardware (with >=2k pages + ecc applied to 512 byte
"subpages" - not the real subpages as reported by the flash chip).

So I guess it's ok to ignore the new "uint32_t offset, int data_len"
arguments in lpc32xx_write_page.

Roland
