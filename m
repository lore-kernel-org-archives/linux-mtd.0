Received: from www13.mailshell.com ([209.157.66.247] helo=mailshell.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A3vGC-0002st-Sm
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2003 11:28:09 +0100
Message-ID: <20030929102718.27650.qmail@mailshell.com>
In-Reply-To: <1064829280.12791.3.camel@hades.cambridge.redhat.com>
References: <1064826976.29857.116.camel@host35>
	 <1064827342.29569.17.camel@hades.cambridge.redhat.com>
	 <20030929093754.7956.qmail@mailshell.com>
	 <1064829280.12791.3.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: 29 Sep 2003 18:27:13 +0800
From: daniel@dmhome.net
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-09-29 at 17:54, David Woodhouse wrote:

> You can just use the DiskOnChip as raw NAND 

> -- look at 
> drivers/mtd/nand/diskonchip.c
Yep, i've seen that one, I completely forgot about it! Good idea, also
the boards I am working with all have a doc socket already.  

> Pick a bootloader to stick into flash with the BIOS. Add NAND flash and
> JFFS2 support, and make it can load and run a kernel from the JFFS2 file
> system (or even a separate raw partition of the flash).
Originally I was thinking about using etherboot as a base to start from,
add support for booting images from a raw flash partition. (they already
have this for booting from disk). 


Thanks a lot,
