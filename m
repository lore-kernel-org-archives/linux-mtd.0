Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VVx6-0007XB-Og
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 13:34:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stephen Brown <sbrown@stirling-dynamics.com>
In-Reply-To: <005301c33bda$9e5621a0$11c8a8c0@stevejunior>
References: <000f01c33bd2$2a579660$11c8a8c0@stevejunior>
	 <1056625602.27553.73.camel@passion.cambridge.redhat.com>
	 <005301c33bda$9e5621a0$11c8a8c0@stevejunior>
Message-Id: <1056630874.27553.124.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 26 Jun 2003 13:34:35 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: quick question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Weird -- what did you do different between your reply directly to me
(which had correct References: headers) and your reply to the list
(which didn't, hence got rejected)? 

(... and then what did you do differently in your _second_ reply to the
list, which worked?)

Had you deleted the mail to which you're replying, or changed folders
and were no longer looking at the same folder, or something?

You're using Outlook and Exchange, right?

On Thu, 2003-06-26 at 13:01, Stephen Brown wrote:
> hi,
> 
> its a DOC 2000 , onboard 8 MB, it resides on the p5e module, Ampro have
> specifically changed the hardware to suit their SBC, which includes a bios
> copy from eprom, they provide utility tools similar to the 'm-sys' ones,
> except are specifically designed for Ampro, if you use the 'm-sys' tools the
> SBC won't boot as 'im assuming' the bios cannot be copied from eprom as the
> first bios screen wont load, this creates a DOS partition as well as a bios
> area stored close to the boot sector.
> 
> 1st problem is, compiling the kernel for the Ampro p5e module takes a good
> half day!!

Weird -- why? Are you building on the board itself and starting from
'make clean' each time? 

You ought to be able to make just the MTD and DiskOnChip modules to
match the kernel you're running, and shouldn't even need to reboot to
test them.

> 2nd problem, the preparation for a standard 'm-sys DOC' is not the same as
> in the specific tools that are written for the p5e module.

Interesting. Do you know what _address_ you tell the p5e DFORMAT utility
to find the DiskOnChip at? Or what address it finds it at?

> I tried quite a few different kernel compiles ( include MTD - etc etc - also
> tried the ones default with kernel 2.4.4 and the latest ones from web ) to
> try and make the DOC compatible with the real-time linux kernel, recompiled
> with RTLinux pre-1, but couldnt get it to work, this takes up a lot of time!

Can you remember details? Did the hardware driver manage to detect the
DiskOnChip and report its presence? Was it only a problem with the
_contents_ of the DiskOnChip?

> I cannot recompile the kernel for Red Hat 7.2 and RTLinux to include ext3
> fs, so I have learned to live with it as ext2.

Why so?

-- 
dwmw2
