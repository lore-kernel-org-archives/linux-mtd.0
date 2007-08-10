Received: from wr-out-0506.google.com ([64.233.184.230])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJYlq-0003Eg-04
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 13:59:35 -0400
Received: by wr-out-0506.google.com with SMTP id m59so116854wrm
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Aug 2007 10:59:30 -0700 (PDT)
Message-ID: <ac921f990708101059g1fdc248bxde61df769d9ac81e@mail.gmail.com>
Date: Fri, 10 Aug 2007 13:59:30 -0400
From: "James Olin Oden" <james.oden@gmail.com>
To: "Ralph Siemsen" <ralphs@netwinder.org>
Subject: Re: What is the correct way to make an mtdchar device available?
In-Reply-To: <20070810155353.GA4326@marvin.netwinder.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
	<20070808192832.GA21249@marvin.netwinder.org>
	<ac921f990708091203s4199fc67w751bc0922f65be5c@mail.gmail.com>
	<20070810134527.GA31564@marvin.netwinder.org>
	<ac921f990708100720g77641a19t20d161f72f5ceb56@mail.gmail.com>
	<20070810155353.GA4326@marvin.netwinder.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/10/07, Ralph Siemsen <ralphs@netwinder.org> wrote:
> On Fri, Aug 10, 2007 at 10:20:49AM -0400, James Olin Oden wrote:
> >
> > So is there a way to tell physmap this information when you load it,
> > rather than have it hard coded in the kernel?  Or am I
> > misunderstanding things?
>
> Some of the physmap variants obtain the information from (say) the
> BIOS or OpenFirmware.  It would be fairly trivial to make physmap
> take module parameters that you pass at modprobe/insmod time.  The
> reason this isn't done is because most users are trying to boot off
> the flash chip (on embedded systems), so its too late... you have to
> provide the address at compile time, or query the firmware.
If I get it working with my test system then I'll likely generate said patch.

<snip>
> So the kernel must be told where to go looking for flash chips.  It will
> then use the code in jedec_probe (or cfi_probe for CFI-compliant chips)
> to identify any chip at the specified address.  It will do so once at
> the beginning of the address/size you specified.  If a device is found,
> but is smaller than the size you specified, then the kernel will try to
> probe a second time right after the first device ends.  This way it will
> find numerous chips that are contiguous in the memory space.
>
I understand now.

> > Yeah your presumption is correct.  I think what the FAQ needs is some
> > question like:
> >
> >    I have flash device X used for BIOS, what do I need to do to update my BIOS?
> >
> > or even:
> >
> >   How do I update my BIOS with MTD?
>
> I think this is (currently) a fairly uncommon situation.  Most of the
> MTD users are working in embedded systems where the entire operating
> system (kernel, userspace and all) lives in the flash.  They have to
> get MTD running really early on in their development cycle, eg. as
> part of bringing up the kernel on the board, while adjusting IRQs and
> such things.  Relatively few people have a fully-working PC that boots
> where they later decide they want to access some on-board flash.
Presently, system manufacturers excpect you to update your BIOS from
within windows or DOS, which too me is just kind of silly, not easily
automated (which holds more weight than the fact that I think its kind
of silly (-;).   As it turns out, MTD has support for some of the
firmware hubs (flash chips) that are used by BIOS's, so theoretically
it should be able to be used in this non-embeded environment way.

>
> I think you hit the nail on the hammer there.  I should probably mention
> that commodity PC hardware may have some additional locking to prevent
> users from accidentally erasing their BIOS.  It could come in the form of
> a GPIO signal that has to be toggled, etc.  If such hardware is present,
> it will likely be motherboard-specific, and it would need to be handled
> in a customized variant of the mapping driver.  Another issue could be
> the "window size", eg. you might only see 64kB of the flash chip even
> when the device is larger due to how the southbridge is setup.
>
Bummer.  It sounds like they are going out of their way to make it
hard to automate BIOS updates.   That explanation may explain why our
current proprietary driver did not work on a system that had the same
south bridge and firmware hub, but was not built by us.

> I am guessing the LinuxBIOS folks have dealt with these sorts of issues,
> perhaps worth a look to see what they've come up with.
I will check that out.

Thank you...james
