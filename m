Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HlmV1-0003xN-EP
	for linux-mtd@lists.infradead.org; Wed, 09 May 2007 09:46:37 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l49DkRfe073442
	for <linux-mtd@lists.infradead.org>;
	Wed, 9 May 2007 15:46:27 +0200 (CEST)
	(envelope-from hcegtvedt@atmel.com)
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <B2FC9E5F094119A0F71B96EF@franken3>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<B2FC9E5F094119A0F71B96EF@franken3>
Content-Type: text/plain; charset=utf-8
Date: Wed, 09 May 2007 15:46:19 +0200
Message-Id: <1178718379.11554.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-09 at 15:34 +0200, Michael König wrote:
> first of all, going through the GIT archive I found out that the 
> cfi_cmdset_0002.c in the latest Axis SDK must be the one from 2006-09-22, 
> since the last Atmel changes are present but the newest SST additions 
> aren't.
> 
> Through some testing I found out that do_write_one_word() works just fine, 
> and the main problem seems to be do_write_buffer().
> To make it work without changing too much, I simply added a call to 
> do_write_one_word() in the beginning of do_write_buffer() and then return. 
> I'm sure it's less efficient that way, but I wanted to get it to work first.

Hmmm, AT49BV642D should not use the do_write_buffer() function at all.
There should be a fixup for this in the kernel.

Is there a "fixup_convert_atmel_pri" function which

<quote>
	/* burst write mode not supported */
	cfi->cfiq->BufWriteTimeoutTyp = 0;
	cfi->cfiq->BufWriteTimeoutMax = 0;
</quote>

This will disable using the "cfi_amdstd_write_buffers" function.

> Since the problem obviously is in do_write_buffer(), I wonder how this 
> command sequence works:
> 
> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
> cfi->device_type, NULL);
> //cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, 
> cfi->device_type, NULL);
> /* Write Buffer Load */
> map_write(map, CMD(0x25), cmd_adr);

This is the standard "Word program" command, take a look on page 11 in
the datasheet.

> I wasn't able to find that sequence either in the documentation of my Atmel 
> chip, or in AMD or Spansion ones.
> Is this some undocumented command sequence that isn't implemented by Atmel?
> Why isn't the bypass mode used anymore?

The Atmel device has a dual-word write function, but AFAIK AMD
(Spansion) devices can write a lot more with a single command. Thus
AT49BV642D can not use the default AMD command for buffer writes.

> Thanks in advance for any insights that might clear up this issue.

Sorry for a bit incomplete answer, but this flash device is working on
the ATNGW100 kit from Atmel. So it should work for you as well.

-- 
With kind regards,

Hans-Christian Egtvedt
