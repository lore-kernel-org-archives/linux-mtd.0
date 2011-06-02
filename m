Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRz8t-0007xn-JZ
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 04:04:25 +0000
Received: by vws8 with SMTP id 8so495558vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 21:03:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
References: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
Date: Thu, 2 Jun 2011 00:03:39 -0400
Message-ID: <BANLkTi=ymbNh93riTAjJ5RVFXogYt9HPYg@mail.gmail.com>
Subject: Re: ubi image only mounts once
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: "Douglass, Woody" <Woodrow.Douglass@qinetiq-na.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 1, 2011 at 1:52 PM, Douglass, Woody
<Woodrow.Douglass@qinetiq-na.com> wrote:
>
> I am trying to build a linux image to run on a custom omap3530 board. I
> have reached a point where my build system builds a UBI image that can
> be mounted exactly once; subsequent mounts fail. Here is the related
> dmesg output:
>
<snip>

Hi,

How are you flashing the image on to NAND - using "ubiformat", or a
direct flashing utility like "nandwrite"?  I ask because it sounds
like the problem described here:

http://linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat

Using "ubiformat" or generating the UBIFS image with the
free-space-fixup (-F) flag will fix the problem, if that's what it is.
If you use the mkfs.ubifs fixup flag, you'll need a very recent kernel
(3.0-rc1), and possibly also Ben Gardiner's patches from a couple days
ago:

http://lists.infradead.org/pipermail/linux-mtd/2011-May/035737.html

-- 
Matthew L. Creech
