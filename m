Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 156V1z-0007Vp-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Jun 2001 11:22:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E156MlF-0000A0-00@infradead.org> 
References: <E156MlF-0000A0-00@infradead.org> 
To: nico@cam.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD CVS update: 'mtd/drivers/mtd/chips cfi_cmdset_0001.c cfi_cmdset_0002.c cfi_probe.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 03 Jun 2001 11:27:02 +0100
Message-ID: <28675.991564022@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


nico@infradead.org said:
> Tentatively cleaned up a bit further common CFI macro usage for code
> reduction with fixed bus geometry.  Tried to push reference to the cfi
> struct far down as possible with the nice effect of reducing the
> number of arguments to many function calls.  It also removed warnings
> about unused variables in cfi_cmdset_0001.s when single interleave is
> configured.

Nice.

> STILL... cfi_probe.c looks like a total mess!  There is certainly a
> way to reduce the code splat and increase readability with clever use
> of some macros. Yet there are some defined in cfi.h that could be put
> to use already.

Agreed. One of the things I want to do to it is remove the JEDEC probe 
altogether and put it in a separate module. That'll help remove a bit of 
the cruft too.

> Open questions: 

> - Is the spot in cfi_probe.c I marked with a "FIXME" actually buggy? 

Looks odd. Can't you send the 0xF0 command to any address in the chip 
though? So it works anyway?

Actually, isn't 0xF0 specific to AMD chips? Intel chips are reset by 0xFF. 
Is there a way to get chips _out_ of CFI mode defined by the spec?

> - Are those calls to cfi_send_gen_cmd() with a static device type 
>   parameter like CFI_DEVICETYPE_X8 actually meant?
>   Could they use cfi->device_type instead?  If so we could get rid
>   of it since a *cfi is already passed to it.

They're meant to be like that. For a 16-bit device in 8-bit mode, we 
actually have to put a '1' on the least significant address line, which 
just to keep us on our toes is called A-1 (the 2nd least significant line 
is A0, the next A1, etc. :)

We have cfi->device_type == 2 for these chips. There is _nothing_ that we can do to 
make the required addresses for the unlock cycles if cfi_send_gen_cmd uses 
that automatically. I suppose we could simply refrain from using 
cfi_send_gen_cmd, though. 

- Why am I writing all this here?  Strange idea, hey? 

Because people _are_ subscribed to the linux-mtd-cvs list, albeit very few 
of them. :)

--
dwmw2
