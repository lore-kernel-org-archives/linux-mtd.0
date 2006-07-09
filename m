Received: from rubidium.solidboot.com ([81.22.244.175] helo=mail.solidboot.com)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fzbtn-0003XG-Q7
	for linux-mtd@lists.infradead.org; Sun, 09 Jul 2006 12:13:00 -0400
Message-ID: <44B12AF4.6030809@solidboot.com>
Date: Sun, 09 Jul 2006 19:12:36 +0300
From: =?ISO-8859-1?Q?Juha_Yrj=F6l=E4?= <juha.yrjola@solidboot.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup()	static
References: <20060626220215.GI23314@stusta.de>	
	<1151416141.17609.140.camel@hades.cambridge.redhat.com>	
	<20060629173206.GF19712@stusta.de>
	<1152436332.25567.12.camel@shinybook.infradead.org>
In-Reply-To: <1152436332.25567.12.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, jlavi@iki.fi,
	Adrian Bunk <bunk@stusta.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>>>> --- linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c.old 2006-06-26 23:18:39.000000000 +0200
>>>> +++ linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c     2006-06-26 23:18:51.000000000 +0200
>>>> @@ -346,7 +346,7 @@
>>>>   *
>>>>   * This function needs to be visible for bootloaders.
>>>>   */
>>>> -int mtdpart_setup(char *s)
>>>> +static int mtdpart_setup(char *s) 
>>> Patch lacks sufficient explanation. Explain the relevance of the comment
>>> immediately above the function declaration, in the context of your
>>> patch. Explain your decision to change the behaviour, but not change the
>>> comment itself.
>> My explanation regarding the relevance of the comment is that it seems 
>> to be nonsense.
>>
>> Do I miss something, or why and how should a bootloader access 
>> in-kernel functions? 
> 
> I'm not entirely sure, but allegedly it does -- Juha, can you elaborate?

Our bootloader doesn't access in-kernel functions, for obvious reasons. 
  The comment in cmdlinepart.c is unfortunately inaccurate.  The 
bootloader does need a mechanism for passing the partition table to the 
kernel, though.  Our partition table is generated on-the-fly by the 
bootloader to guarantee that each partition gets a certain number of 
non-bad NAND blocks.

We used to do this by passing the partition table in a string compatible 
with cmdlinepart syntax.  The kernel NAND driver then just passed the 
string received from the bootloader to mtdpart_setup().

Nowadays there is a better way of doing this, so as far as we are 
concerned, mtdpart_setup() can be made static again.  We'll migrate our 
MTD drivers to use the platform_data mechanism instead.

Cheers,
Juha
