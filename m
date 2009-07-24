Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUDkM-0007jw-1U
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 05:55:13 +0000
Message-ID: <4A694C3C.4010108@gmail.com>
Date: Fri, 24 Jul 2009 08:53:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: erno@gulp.u--3.com
Subject: Re: UBIFS fails & crashes on SheevaPlug
References: <20090723185928.GA1612@gulp.u--3.com>
In-Reply-To: <20090723185928.GA1612@gulp.u--3.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/23/2009 09:59 PM, erno@gulp.u--3.com wrote:
> Hello,
>
> I installed Debian on my SheevaPlug following instructions at
> <http://www.cyrius.com/debian/kirkwood/sheevaplug/>  and everything
> seemed to work fine until...
>
> I wanted to try UBIFS on the built-in flash and followed
> the instructions for formatting the internal flash
> at http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS
> except I made an empty image (no -r parameter for mkfs.ubifs).
> After the ubiattach command it complained about a read-only fs
> and some error messages from the kernel had appeared in the log:
>
> [  190.500000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [  190.510000] UBI: logical eraseblock size:    129024 bytes
> [  190.520000] UBI: smallest flash I/O unit:    2048
> [  190.520000] UBI: sub-page size:              512
> [  190.530000] UBI: VID header offset:          512 (aligned 512)
> [  190.530000] UBI: data offset:                2048
> [  191.630000] UBI error: ubi_io_write: error -5 while writing 512 bytes
> to PEB 4054:512, written 0 bytes
> [  191.630000] UBI warning: ubi_eba_write_leb: failed to write VID
> header to LEB 2147479551:0, PEB 4054
> [  191.640000] UBI: try another PEB
> [  191.650000] UBI error: ubi_io_write: error -5 while writing 512 bytes
> to PEB 4053:512, written 0 bytes
> [  191.660000] UBI warning: ubi_eba_write_leb: failed to write VID
> header to LEB 2147479551:0, PEB 4053
> [  191.670000] UBI: try another PEB
> [  191.670000] UBI error: ubi_io_write: error -5 while writing 512 bytes
> to PEB 4052:512, written 0 bytes
> [  191.680000] UBI warning: ubi_eba_write_leb: failed to write VID
> header to LEB 2147479551:0, PEB 4052
> [  191.690000] UBI: try another PEB
> [  191.690000] UBI error: ubi_io_write: error -5 while writing 512 bytes
> to PEB 4051:512, written 0 bytes
> [  191.700000] UBI warning: ubi_eba_write_leb: failed to write VID
> header to LEB 2147479551:0, PEB 4051
> [  191.710000] UBI warning: ubi_ro_mode: switch to read-only mode
> [  191.720000] UBI error: autoresize: cannot auto-resize volume 0

http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
