Received: from adsl-66-159-197-3.dslextreme.com
	([66.159.197.3] helo=willie.blueskylabs.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NGNZ-0001ev-Ka
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 19:19:25 +0100
Message-ID: <3EDCE6D8.4010405@blueskylabs.com>
Date: Tue, 03 Jun 2003 11:20:08 -0700
From: Andrew Goodney <andrew@blueskylabs.com>
MIME-Version: 1.0
To: Vikram Mehta <vm6580@hotmail.com>
References: <Law14-F878P8Sp1ppTN0002fd45@hotmail.com>
	<1054633243.17921.34.camel@passion.cambridge.redhat.com>
In-Reply-To: <1054633243.17921.34.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: uclinux-dev@uclinux.org
Subject: Re: cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type,
 NULL); not workin
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>On Tue, 2003-06-03 at 10:23, Vikram Mehta wrote:
>  
>
>>Hi joern,
>>Thanx
>>I agree this format was confusing. So let me put it simply
>>
>>in cfi_probe.c  in  cfi_probe_chip function
>>
>>cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>>Works
>>but
>>
>>cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>>doesnot work.
>>It fails when   __raw_writew(d, map->map_priv_1 +adr); is called in its 
>>stack.
>>    
>>
>
>>From the Cc I'm inferring you're using uCLinux. Are you running with
>your kernel in flash? Is your kernel in the _same_ flash chip as is
>being probed here?
>
>If so, it's not really surprising it doesn't work. As soon as you send
>the '0x98' command, your entire kernel turns into the CFI query results
>and it isn't really going to work too well :)
>
>  
>
We had this problem as well on our uClinux systems. Once we changed to 
running the kernel out of RAM our chips were detected properly.

The uClinux archives have a large amount of information on how to get 
uClinux+MTD+JFFS(2) to play nicely together. I suggest searching the 
online archive, as the subject comes up very often on that list.

Good luck,
Andrew Goodney
andrew@blueskylabs.com
-----------------------
www.blueskylabs.com
