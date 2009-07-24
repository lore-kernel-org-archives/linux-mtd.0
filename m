Received: from oul111-200.netplaza.fi ([80.75.107.200] helo=gulp.u--3.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MUKZq-0000vg-BO
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 13:12:50 +0000
Date: Fri, 24 Jul 2009 15:12:41 +0200
From: Erno Kuusela <erno@gulp.u--3.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
Message-ID: <20090724131241.GC1792@gulp.u--3.com>
References: <20090723185928.GA1612@gulp.u--3.com> <4A694C3C.4010108@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A694C3C.4010108@gmail.com>
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2009 at 08:53:00AM +0300, Artem Bityutskiy wrote:
> On 07/23/2009 09:59 PM, erno@gulp.u--3.com wrote:
>> [  191.690000] UBI error: ubi_io_write: error -5 while writing 512 bytes
>> to PEB 4051:512, written 0 bytes
>> [  191.700000] UBI warning: ubi_eba_write_leb: failed to write VID
>> header to LEB 2147479551:0, PEB 4051
>> [  191.710000] UBI warning: ubi_ro_mode: switch to read-only mode
>> [  191.720000] UBI error: autoresize: cannot auto-resize volume 0
>
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail

Ah, ok. I did google for that error message but searching for 
"ubi_io_write: error -5" doesn't yield anything useful for the first 
screenful of results..

So workaround would be to disable CONFIG_MTD_NAND_VERIFY_WRITE or to 
follow the "ignore sub pages" entry from the faq...

Indeed the latter seems to work, if I give --vid-hdr-offset 2048 option 
to the ubinize, ubiformat & ubiattach commands. Thanks!

Maybe it would be better to disable the verify & subpages combo
until the bug is fixed? Especially since it crashes the kernel...

Also, ubiformat mentioned 1400+ "bad" eraseblocks, what should I make of 
that? Is it really failed flash cells, just some blocks reserved for 
u-boot and stuff, or blocks traumatized from my earlier misadventures 
with ubiformat parameters?

Erno
