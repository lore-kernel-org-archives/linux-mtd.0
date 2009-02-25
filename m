Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcOpk-0000n7-7s
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 18:50:19 +0000
Received: by gxk4 with SMTP id 4so378404gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Feb 2009 10:50:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B3F8896E1733D4787DDB0EA1C7FF91F7556E7@ukmail.uk.wirelessworld.airvananet.com>
References: <AcmXQvsMZtFKpGUCSJK7bv2cngp9Eg==>
	<4B3F8896E1733D4787DDB0EA1C7FF91F7556E7@ukmail.uk.wirelessworld.airvananet.com>
Date: Wed, 25 Feb 2009 13:50:14 -0500
Message-ID: <8bd0f97a0902251050i3d6fc22qaad178a1d7e5b51b@mail.gmail.com>
Subject: Re: [PATCH] [MTD] devices/mtd_dataflash: Add SW sector protection
	support
From: Mike Frysinger <vapier.adi@gmail.com>
To: Mike McTernan <mmcternan@airvana.com>,
	Ulf Samuelsson <ulf.samuelsson@atmel.com>,
	David Brownell <dbrownell@users.sourceforge.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 25, 2009 at 07:17, Mike McTernan wrote:
> From: Michael McTernan <mmcternan@airvana.com>
>
> The Atmel AT45DBxxxD serial DataFlash parts allow software protection of
> specific device sectors. =A0This is detailed in section 8, "Sector
> Protection" of the data sheets available on their site (e.g.
> http://www.atmel.com/dyn/resources/prod_documents/doc3597.pdf).
>
> This patch expands the device probe tables to include sector geometry
> information, and issues the "enable sector protection command" after a
> compatible part is found and the build is configured with
> CONFIG_MTD_DATAFLASH_SWPROT. =A0The lock() and unlock() functions are the=
n
> implemented to allow manipulation of the "sector protection register" in
> the device such that program/erase operations can be selectively allowed
> or blocked. =A0Note that this register is subject to a limit of 10,000
> erase/program cycles according to the datasheet.
>
> Devices ship with erase/program access allowed for the whole device by
> default, and operation of the driver is unchanged if
> CONFIG_MTD_DATAFLASH_SWPROT is not set. =A0It should not therefore cause =
a
> problem for existing devices to enable this option.
>
> This has been tested with the AT45DB321d, but the probe tables updated
> from data sheets such that it should work with the following parts:
>
> =A0AT45DB011D
> =A0AT45DB021D
> =A0AT45DB041D
> =A0AT45DB081D
> =A0AT45DB161D
> =A0AT45DB321D
> =A0AT45DB642D

Ulf Samuelsson seems to be big on dataflash stuff, and maybe David
Brownell can find some time to check this out ...

in case you guys havent seen this e-mail, here's the archive:
http://lists.infradead.org/pipermail/linux-mtd/2009-February/024692.html

> This is probably a one-off patch, so I've included it here rather than
> setting up a git tree. =A0Apologies for that.

you dont need to setup a git tree for people to pull from.  you can
clone one and use the regular git stuff one off:
git commit -a -s ......
git format-patch HEAD^
git send-email 0001-......
git reset --hard HEAD^

so now your repo again matches the one you cloned.  (yes, i know you
can get into creating local branches and blah blah but people not
familiar with git like to operate in this "classical" mode which is
more akin to svn).

since you seem to be using the Blackfin svn trunk, you can get the
same tree but via git here:
http://blackfin.uclinux.org/git/?p=3Dreadonly-mirrors/linux-kernel.git;a=3D=
summary

this would also fix the word-wrapping issues in this patch ...
-mike
