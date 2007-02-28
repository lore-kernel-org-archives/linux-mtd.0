Received: from wr-out-0506.google.com ([64.233.184.226])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMRbV-0003LG-Vg
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 11:24:36 -0500
Received: by wr-out-0506.google.com with SMTP id i20so261635wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Feb 2007 08:24:33 -0800 (PST)
Message-ID: <87f18bad0702280824w7c35a320u8f4f44621ba4efdb@mail.gmail.com>
Date: Wed, 28 Feb 2007 18:24:31 +0200
From: "J. Doo" <doodiexx@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash mounting problem
In-Reply-To: <20070228170648.34bd4118@dhcp-252-105.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
	<20070228094631.2e8f7b45@dhcp-252-105.norway.atmel.com>
	<87f18bad0702280717k6d50b712j9f166eb29f2ca734@mail.gmail.com>
	<20070228170648.34bd4118@dhcp-252-105.norway.atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > According to the second table in
> > http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_bootloader
> > It should be 85 19 03 20 ...
>
> I had a look inside flash_eraseall, and it seems like it converts
> the 16-bit magic values to target_endian, which is by default the CPU's
> native endian. So 0x1985 becomes 0x19, 0x85 and 0x2003 becomes 0x20,
> 0x03 on a big endian CPU. The values you read are therefore correct as
> far as I can tell, but of course, I could be missing something...

In include/mtd/jffs2-user.h, cpu_to_je16 swaps bytes if target_endian
is not equal to __BYTE_ORDER. But this is always false since it's
value is set to __BYTE_ORDER in flash_eraseall. Does that make sense ?


> It's a bit strange that you don't get any error messages from the
> kernel before the mount fails though. Enabling MTD debugging might help
> of course. Btw, did you check dmesg? If the loglevel is set too low,
> you might not see the error messages on the console.

I thought I checked that, but now I see a message in dmesg when I try to mount:

jffs2_get_sb(): dev_name "/dev/mtd1"
jffs2_get_sb(): path_lookup() returned 0, inode 93db1254

mtd debug level is at max (3), jffs2 debug is also set to max (2), but
that's all I see.

I've read somewhere that mount complains if the magic number were
wrong, but I don't see that either.

Anyone, any ideas ?

BR,
J.Doo
