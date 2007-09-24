Received: from smtp4-g19.free.fr ([212.27.42.30])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IZiNJ-0003mX-EE
	for linux-mtd@lists.infradead.org; Mon, 24 Sep 2007 03:29:03 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id A0E4E6F2C6
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Sep 2007 09:28:58 +0200 (CEST)
Received: from [192.168.111.252] (cla34-1-88-160-215-156.fbx.proxad.net
	[88.160.215.156])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 868636F252
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Sep 2007 09:28:58 +0200 (CEST)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: modify boot environment parameters
Date: Mon, 24 Sep 2007 09:28:07 +0200
References: <20070923220352.8B3322405D@gemini.denx.de>
In-Reply-To: <20070923220352.8B3322405D@gemini.denx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200709240928.08338.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Denk,

I am using proprietary (ARMmon) binary version of bootloader (like u-boot a=
nd=20
not u-boot bootloader) that gives support to modify environment variables=20
only from the bootloader prompt. But, In my case, I want to modify boot=20
environment option
"root=3D/dev/mtdblock1" to "root=3D/dev/mtdblock2" and viceversa on success=
ive=20
reboot.

The environment variables are stored at the offset 0x00050000  ( 4th block)=
 on=20
the NOR flash (/dev/mtdblock0).

Is there any utility tool to access and modify a particular block 0x0005000=
0=20
on the NOR flash ? I came across u-boot/tools/env but its ment for u-boot.=
=20
Will it give support to other flash env access with some modification ?

Thanks
Sara




Le Lundi 24 Septembre 2007 00:03, Wolfgang Denk a =E9crit=A0:
> In message <200709191804.24336.schane@osmozis.com> you wrote:
> > Are there utilities to modify the boot environment (like u-boot) block =
on
> > the flash from within the linux ?
>
> Of course there are. But this is off topic here.
>
> > I am looking for information to modify the boot environment block on the
> > NOR (/dev/mtd0) flash at offset 0x5000.
>
> See u-boot/tools/env/
>
> Best regards,
>
> Wolfgang Denk
