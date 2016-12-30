Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cN45O-0004e1-GP
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2016 20:47:36 +0000
Subject: Re: [PATCH RFC 2/2] ubi: add support for UBI_EC_FLAG_ERASE_FROM_HERE
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <20161230171151.13448-1-zajec5@gmail.com>
 <20161230171151.13448-2-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <9b0bfe28-8d77-e59e-977a-5837002356b1@nod.at>
Date: Fri, 30 Dec 2016 21:47:06 +0100
MIME-Version: 1.0
In-Reply-To: <20161230171151.13448-2-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafał,

On 30.12.2016 18:11, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This flag can be used to mark block that should start erasing process
> (including that block itself).
> This can be useful for devices that don't support UBI natively (in a
> bootloader or original firmware). In such cases we need to flash
> ubinized image which is usually created with autoresize flag. In such
> cases only few blocks of the whole ubi partition are programmed and the
> rest of them should be formatted when attaching.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> Hi,
> 
> This patch is my attempt of getting upstream solution of problem we were
> solving locally in OpenWrt/LEDE projects.
> 
> There are a lot of home routers with original firmware and bootloaders
> not supporting UBI in any way. This is where we use ubinize tool to
> prepare images with UBI. Unfortunately flashing such an image to the
> firmware partition writes only few blocks (as many as were created by
> ubinize). We need some way of formatting remainig blocks of the firmware
> (ubi) partition.
> 
> This is RFC and I'd really like to hear your comments.
> 
> First of all using a global erase_all_next_pebs is a pretty bad idea. I
> mean to store this information in struct ubi_attach_info but there goes
> my question:
> 1) Should I pass "struct ubi_attach_info" to the ubi_io_read_ec_hdr to
>    let this function set some interfnal flah that all next blocks should
>    be erased?
> OR
> 2) Should I introduce UBI_IO_ERASE (or similar) and add support for this
>    new "error" in the scan_peb?
> 
> Second question: I wasn't sure what's the better solution:
> 1) Create empty block with UBI_EC_FLAG_ERASE_FROM_HERE
> OR
> 2) Set UBI_EC_FLAG_ERASE_BEYOND in the last block
> 
> Third question: what impact this change can have? I'm pretty sure I'll
> need to adjust ubiformat tool. We don't want to format ubi with writing
> image at the same time, just to trigger erasing blocks on the next
> attach attempt. I guess ubiformat shouldn't copy/write this flag when
> writing an image (--flash-image=<file> option). What else should I
> consider?

As discussed on IRC, I'm not fond of this patches.

To summarize, your target devices have "bad" bootloaders pre-installed.
You cannot change nor fix them. If you ask such a bootloader to flash
the UBI image to the MTD partition it will erase and program only as
much blocks as the image allokates and the remaining blocks on the MTD
partition stay untouched.
Later an ubiattach will fail since UBI wants to see either valid headers
or all 0xff bytes but it finds old data since the bootloader did not erase
all blocks.
This patches implement an "EOF marker" to teach UBI about the last valid
block and let UBI do the erase.

Do these bootloaders really don't offer a command to erase the whole MTD
partition? If they offer a flash command I'd expect an erase command too.

I recommend using an initramfs. In the initramfs you can do all the clean-up
your bootloader misses. Using flash_erase you can do the erase yourself,
load the ubi module, run ubiattach, mount ubifs and hand-over to the regular
userspace.

Brian, Boris, Artem, what do you think?
I'd like to keep UBI free from such workarounds if it can be addressed
in another way.

Thanks,
//richard
