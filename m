Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C19si-0005VF-JB
	for linux-mtd@lists.infradead.org; Sat, 28 Aug 2004 16:33:02 -0400
Message-ID: <4130EBF7.70101@inf.u-szeged.hu>
Date: Sat, 28 Aug 2004 22:32:55 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <05b901c48c7f$df752c70$fd0ba8c0@briantpc>
	<200408280106.25436.dominik.karall@gmx.net>
In-Reply-To: <200408280106.25436.dominik.karall@gmx.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian T <btuch@usa.net>
Subject: Re: Error: jffs2_decompress returned -5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dominik Karall wrote:
> On Friday 27 August 2004 23:50, Brian T wrote:
 >
>>After patching 2.4.27 with the snapshot from today, and adding "__ffs" to
>>compatmac.h , everything compiles, but then when reading my jffs2 file
>>system I get this :
>>
>>Freeing unused kernel memory: 68k freed
>>JFFS2 compression type 0x06 not available.
>>Error: jffs2_decompress returned -5
>>JFFS2 compression type 0x06 not available.
>>Error: jffs2_decompress returned -5
>>Kernel panic: No init found.  Try passing init= option to kernel.
 >
> I think you specified a compression type when building the image with 
> mkfs.jffs2, which isn't selected in the kernel config. But I can't tell you 
> which type 0x06 is.

0x06 means ZLIB. (you can check it in jffs2.h)

Is there CONFIG_JFFS2_ZLIB in your kernel config?

Regards,
Ferenc
