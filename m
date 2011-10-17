Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFtku-0007GM-GF
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 20:25:53 +0000
Received: by bkbc12 with SMTP id c12so8668484bkb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 13:25:49 -0700 (PDT)
Subject: Re: UBIFS recovery fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Kuhn <cheeef@swissonline.ch>
In-Reply-To: <4E9C2DAC.7090109@swissonline.ch>
References: <4E9C2DAC.7090109@swissonline.ch>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 Oct 2011 23:17:48 +0300
Message-ID: <1318882668.2172.10.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-17 at 15:29 +0200, Daniel Kuhn wrote:
> Hi,
> 
> I have a problem with a device which uses UBI + UBIFS on a 32GB NAND 
> Flash (16*2GB). The
> filesystem worked without problems for a couple of months but now I get 
> an error if I try to mount the volume.
> Attaching the UBI-Device works fine as you can see in the following 
> messages:

This issue looks like one of the MLC-specific ones. Unfortunately,
no one really invested time into making UBIFS support MLC very well.
It needs some more work. It also have some issues related to unstable
bits in modern SLC.

In short - if you want to use UBIFS on MLC - you should not have unclean
reboots. If you want to make UBIFS 100% uclean-reboot save on MLC - you
need to work on it some more.

We (the original authors) developed and tested it on very robust SLC
NAND.

Unfortunately, I do not work with MTD for few years already and have
no spare time to make it MLC-robust. My last attempt was this spring -
I started making integck test (in mtd-utils) support emulated power
cuts. The idea was to improve UBIFS power-cut emulation infrastructure
and make it emulating unstable bits, and then test and fix all issues.
But then I realized that I simply will not have time to finish it,
so left the work half-done.

If someone wants to see UBIFS 100% or near 100% power-cut safe on
MLC or one of shitty modern SLCs - he needs to invest men-hours.
I can help by suggesting and reviewing. Although the funny thing is
that eMMCs die and lose data in case of power cuts very often :-)

> UBI: wear-leveling threshold:    4096
Are you sure it is good for MLC? What is your eraseblock life-cycle?

> Is there a way to recover the data on the device?

If you just have precious data which you need - I think:
1. Make a dump of the flash.
2. Verify that on another device you can flash it and reproduce this
issue.
3. Just hack the function in kernel that fails to return 0 instead
of error for that case, and I think you will be able to mount your
flash and copy your data.

But if you want this to never happen again - you need to prepare
for a several months project (providing you have a good kernel
engineer).

HTH :-)
