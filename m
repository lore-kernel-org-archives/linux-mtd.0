Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DoUB8-000588-55
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 18:40:11 -0400
Message-ID: <42C5C638.4050303@mvista.com>
Date: Fri, 01 Jul 2005 15:39:52 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <E1Do7j2-0004SA-7P@phoenix.infradead.org>
	<20050701084901.GA20056@wohnheim.fh-wedel.de>
In-Reply-To: <20050701084901.GA20056@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tpoynor@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/maps mainstone-flash.c, NONE, 1.1 Kconfig, 1.53,
 1.54 Makefile.common, 1.28, 1.29
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Thu, 30 June 2005 23:41:40 +0100, tpoynor@infradead.org wrote:
> 
>>--- NEW FILE mainstone-flash.c ---
> 
> 
> Since this one is new, would you mind some comments?

Not at all, thanks.

Will fix the 80 columns and trailing whitespace.

>>		mainstone_maps[i].virt = ioremap(mainstone_maps[i].phys, WINDOW_SIZE);
>>		if (!mainstone_maps[i].virt) {
>>			printk(KERN_WARNING "Failed to ioremap %s\n", mainstone_maps[i].name);
>>			if (!ret)
>>				ret = -ENOMEM;
>>			continue;
>>		}
>>		mainstone_maps[i].cached = ioremap_cached(mainstone_maps[i].phys, WINDOW_SIZE);
>>		if (!mainstone_maps[i].cached)
>>			printk(KERN_WARNING "Failed to ioremap cached %s\n", mainstone_maps[i].name);
> 
> 
> Shouldn't we error out instead of printing a message and continuing
> on?

The code still tries to handle the other flash bank, leaving the 
un-ioremapped bank unconfigured, and only errors out if neither bank can 
be probed+mapped.  In my limited experience with the mainstone board, 
the above will not fail if the flash is not present but instead the CFI 
probe will fail, but it does seem useful to still try to handle the 
other bank.

>>		mymtds[i] = do_map_probe("cfi_probe", &mainstone_maps[i]);
>>		
>>		if (!mymtds[i]) {
>>			iounmap((void *)mainstone_maps[i].virt);
>>			if (mainstone_maps[i].cached)
>>				iounmap(mainstone_maps[i].cached);
> 
> 
> This is broken.  After above code, mainstone_maps[i].virt can be NULL.
> So either you need a NULL check for both or for none.

Not sure I understand... if ioremap returns NULL for 
mainstone_maps[i].virt then we already skip to the next loop iteration. 
  Unless do_map_probe can modify the value which I didn't think it did. 
  mainstone_maps[i].cached on the other hand can be NULL here per the 
code above.

>>		if (parsed_parts[i])
>>			kfree(parsed_parts[i]);
> 
> 
> kfree() can be called unconditionally.

OK.  Something about passing a NULL pointer to anything gives me the 
heebie-jeebies ;)

-- 
Todd
