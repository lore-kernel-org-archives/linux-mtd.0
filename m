Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj6Bb-00014p-G9
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2016 14:24:37 +0000
Received: by mail-wm0-x22a.google.com with SMTP id p65so276626983wmp.1
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2016 07:24:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
Date: Thu, 24 Mar 2016 11:23:26 -0300
Message-ID: <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
Subject: Re: ubiblock RW
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benson Young <benson6877@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+MTD

On 23 March 2016 at 14:40, Benson Young <benson6877@gmail.com> wrote:
> Hello Ezequiel,
>
> I came upon the discussion about block device emulation over UBI.
> http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-on=
-top-of-ubi-volumes-with-read-write-support
>
> I understand the most recent implementation is read-only emulation for
> mounting squashfs based file system.
> However, I would really like to see the write option be brought back. If
> not, can you please help me about enabling the write option in my build?
> I have used the patch listed in the following link
> https://lwn.net/Articles/525957/
> but i couldn't find any accompanying util that allows me to create the ub=
i
> block volume.
>

You should be able to use mtd-utils' ubiblock tool (maybe you'll need to do
some modifications).

http://www.linux-mtd.infradead.org/doc/ubi.html#L_ubiblock

> Reason for this request is that I am looking into root file system
> encryption over un-managed NAND flash. Now the mainline method of disk
> encryption in Linux revolves around
> dm-crypt module which requires a block device. i am under the impression
> that using mtdblock works to an extent until the partition you try to
> map/encrypt has bad blocks in it.
> I have seen discussion about using UBIFS, and I have seen a paper discuss=
ing
> it, where the author embeds the encryption engine within UBI layer, so ea=
ch
> write and read is encrypted. However, its a path I would take when I have=
 no
> choice. Right now dm-crypt is my first choice basically because of the
> availability of support/discussion/information.
>
> I also saw you mentioned that you don't have NAND flash for testing, this=
 is
> something that I can help with. I have an abundance of NAND flash devices=
.

I have some devices with SLC NANDs now, but thanks for the offer.

> For simplicity sake, I work with SLC because of better endurance compared=
 to
> MLC. I am also curious about flash endurance with EXT4 over UBI. Destruct=
ive
> erase/write will definitely on my to-do list.
>

So, like I said here:

http://linux-mtd.infradead.narkive.com/YF0XOFxY/block-device-emulation-on-t=
op-of-ubi-volumes-with-read-write-support

We can definitely implement write support if we have a good use case for it=
.
Encryption might be one.

Richard, what do you think?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
