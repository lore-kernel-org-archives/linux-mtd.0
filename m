Received: from wr-out-0506.google.com ([64.233.184.225])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk2Nt-00016s-5B
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 12:47:58 -0500
Received: by wr-out-0506.google.com with SMTP id i11so708369wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Nov 2006 09:47:39 -0800 (PST)
Message-ID: <f96d234e0611140947n36d1269ao8235f7cbec4fd920@mail.gmail.com>
Date: Tue, 14 Nov 2006 12:47:37 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "Martin Egholm Nielsen" <martin@egholm-nielsen.dk>
Subject: Re: Access to NOR from Linux - what is required?
In-Reply-To: <ejck96$7qf$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ejck96$7qf$1@sea.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/14/06, Martin Egholm Nielsen <martin@egholm-nielsen.dk> wrote:

> I know this is a rather vague question, but how do I gain access to the
> NOR flash on my board?
>
> Ok, a little more clarification follows: I have a PPChameleon board from
> which I can access the NOR from U-Boot. However, launching Linux will
> only grant me access to the NAND. For the NAND I see there is a
> "drivers/mtd/nand/ppchameleonevb.c" file responsible for setting up a
> lot of stuff.
> However, with my knowledge I looked for a "drivers/mtd/nor" directory,
> as well, to see what others have done for their boards. But this does
> not exist. Hence my question...
>
> Moreover, and again due to my lack of knowledge, another question: I use
> my NAND device with a filesystem (JFFS2/YAFFS), but I guess the NOR does
> not have one (and should not have one since I use it from U-Boot). So if
> I succeed to gain access from Linux to the NOR, I/O operations should be
> performed using "dd" or what?

You can often just map in your NOR device using the kernel command
line without any kernel changes.  Something like:

CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_CMDLINE="mtdparts=phys_mapped_flash:256k(boot)ro,0x1C0000(kernel),-(root)"
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x0000000
CONFIG_MTD_PHYSMAP_LEN=0x4000000
CONFIG_MTD_PHYSMAP_BANKWIDTH=4

There is documentation on mtdparts in:
drivers/mtd/cmdlinepart.c

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com
