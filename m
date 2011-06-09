Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUerO-0006kJ-AZ
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 13:01:19 +0000
Received: by vxd2 with SMTP id 2so1485471vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 06:01:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4DF0C03E.90909@free-electrons.com>
References: <4DECC41F.5060808@free-electrons.com>
	<1307370761.3112.76.camel@localhost>
	<4DF0C03E.90909@free-electrons.com>
Date: Thu, 9 Jun 2011 22:01:14 +0900
Message-ID: <BANLkTikOR5_XZoh7DWwvcqK2t_fy28=NyQ@mail.gmail.com>
Subject: Re: impact of 2X_PROGRAM on read operations
From: Kyungmin Park <kmpark@infradead.org>
To: David Wagner <david.wagner@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 9, 2011 at 9:44 PM, David Wagner
<david.wagner@free-electrons.com> wrote:
> On 06/06/2011 04:32 PM, Artem Bityutskiy wrote:
>> On Mon, 2011-06-06 at 14:12 +0200, David Wagner wrote:
>>> Is there a way to safely read without 2X_PROGRAM enabled once it has
>>> been flashed with a 2X_PROGRAM-enabled flasher (e.g. patched u-boot).
>>
>> Not sure about u-boot, but AFAIK 2x is a completely separate mode which
>> gives you I/O speed-up but makes things incompatible with "normal" mode.
>> E.g., you can mount JFFS2 only in one of the modes.
>>
>
> Ok, so I guess it doesn't make sense trying to address the issue of
> incompatibilities.
>
> I may have to check once again, but I'm pretty sure, however, that I
> managed to flash a UBI image with a 2X_PROGRAM-enabled u-boot and read
> it with a regular kernel. The u-boot code for 2X_PROGRAM handling seems
> to basically be a copy-paste from the kernel.
> If the diagram in my first mail is correct, that could not be possible.
>
> Kyungmin, do you know what's wrong in my reasoning ?
Since we don't know how program hen 2x_program mode. even though
logically BufferRAM0 data will be located block even, BufferRAM1 will
be copied to block odd. but it's not clear.

Can you tried to program the sample 4KiB data when 2X_PROGRAM and read
(block even, page n) and read (block odd, page n) and compare it? then
you can find a difference.

I'm not tried to compare the compatible issue between normal and 2x mode.

Thank you,
Kyungmin Park
>
>
> Regards,
> David Wagner.
> --
> David Wagner, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
