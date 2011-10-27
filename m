Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJVQB-00060K-Kk
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2011 19:15:24 +0000
Received: by faaf16 with SMTP id f16so3954625faa.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Oct 2011 12:15:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEq8YR8Vq1mDxOovREb5CBH-PfoWAP4_p-54W4icZ8bvip90Eg@mail.gmail.com>
References: <CAEq8YR8Vq1mDxOovREb5CBH-PfoWAP4_p-54W4icZ8bvip90Eg@mail.gmail.com>
From: Robert Orzanna <orschiro@googlemail.com>
Date: Fri, 28 Oct 2011 08:14:39 +1300
Message-ID: <CAEq8YR_pw4LO_1wvUELXR9Q7e11NA6xU0_082hYJ=oyZd5+=8g@mail.gmail.com>
Subject: Re: Access to a xd memory card
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No ideas?

I have to add that the mounting of xd cards is done without any issues
on Ubuntu and distributions based on it.

Although I could not figure out how it is done I want to understand
how it is done manually.

Should not mtd-utils be the solution then?

Regards

2011/10/26 Robert Orzanna <orschiro@googlemail.com>:
> Hello,
>
> I wonder if mtd is the right approach to mount my xd memory card.
> Before I installed mtd-utils I had two corresponding files in /dev
> called mtd0 and mtd0ro. However, I was not able to mount them as they
> are no block devices. Now after installing mtd-utils those two files
> do not always exist anymore and I do not have any idea how to process
> further.
>
> I should mention that I use an Archlinux 64 bit with kernel 3.0.6-2
> and mtd-utils 1.4.6.
>
> Output of lspci -v.
>
> 0d:00.3 System peripheral: Ricoh Co Ltd xD-Picture Card Controller (rev 12)
> Subsystem: Lenovo Device 210d
> Flags: bus master, medium devsel, latency 64, IRQ 17
> Memory at febfe800 (32-bit, non-prefetchable) [size=256]
> Capabilities: <access denied>
> Kernel driver in use: r852
> Kernel modules: r852
>
> If you need more information, just let me know and I will provide them.
>
> Thank you for your advice.
>
> Regards,
>
> Robert
>
