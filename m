Received: from saturn.open-widgets.com ([209.251.101.200]
	helo=saturn.billgatliff.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj7GM-00008L-A2
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2004 01:34:34 +0000
Received: from billgatliff.com (meta-adsl-71.mtco.com [207.179.223.71])
	by saturn.billgatliff.com (Postfix) with ESMTP id E7E614E0004
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jan 2004 19:32:19 -0600 (CST)
Message-ID: <400DD6A4.6040903@billgatliff.com>
Date: Tue, 20 Jan 2004 19:32:20 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20040120215050.M62159@onemyth.net>
	<1074638670.16045.74.camel@imladris.demon.co.uk>
In-Reply-To: <1074638670.16045.74.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Intel flash and cfi_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David:


I had seen the lines of code that Thayne had referred to; there are 
other exit paths out of that code that leave the flash in READ STATUS 
mode, apparently.  Haven't researched it enough yet.

Let me know what, if anything, I can do to help!


b.g.


David Woodhouse wrote:

>On Tue, 2004-01-20 at 13:50 -0800, Dan Post wrote:
>  
>
>>Hi,
>>
>>I was looking at the cfi_probe.c file, and noticed that there are numerous
>>'0xF0' commands to flash (theoretically to put the flash back into read array
>>mode).  This is incorrect in terms of Intel flash; according to the datasheets
>>for L18/30 and K3/18, the "read array" command is 0xFF.
>>    
>>
>
>Yeah.... the CFI spec says how to get into query mode, but unfortunately
>doesn't specify how to get out of it. And without getting out of it we
>can't check for aliases.
>
>We'd previously observed that 0xF0 happened to work for Intel chips...
>now evidently it doesn't any more. I suspect we might just have to bite
>the bullet and make it depend on the chip type, although it was easier
>to avoid that.
>
>  
>
>>What would happen if we issued an 0xF0;0xFF to an AMD chip?  Or 0xFF;0xF0? 
>>Any AMD chip-heads care to answer?  It looks like it will "work" on Intel chips...
>>    
>>
>
>Hmmm. That could work.
>
>  
>

-- 
Bill Gatliff
Embedded GNU, Linux, and other board support packages.
bgat@billgatliff.com
