Received: from mail-vn0-x234.google.com ([2607:f8b0:400c:c0f::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ypdwb-0004BW-TR
 for linux-mtd@lists.infradead.org; Tue, 05 May 2015 14:35:35 +0000
Received: by vnbf1 with SMTP id f1so17048679vnb.5
 for <linux-mtd@lists.infradead.org>; Tue, 05 May 2015 07:35:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <553983c4.1e577cd2.5547694c.c00cd@tlen.pl>
References: <553983c4.1e577cd2.5547694c.c00cd@tlen.pl>
Date: Tue, 5 May 2015 16:35:08 +0200
Message-ID: <CAFLxGvx31ey877oxXawEPwnyf+NHFxqzh6LhU09KeJzfRDz_BQ@mail.gmail.com>
Subject: Re: File in JFFS2 corrupted after power loss during removal of other
 files
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Marcin Adamski <mass85@tlen.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 4, 2015 at 2:42 PM, Marcin Adamski <mass85@tlen.pl> wrote:
> Hi
>
> I am working with Linux (3.4.31+) embedded system booting from JFFS2 part=
ition. I frequently encounter a problem of a file corruption when power los=
s occurs while other files are being removed. It happens during upgrade pro=
cedure of the platform. These are simplified steps of the upgrade:
> 1. Download tar.gz containing (among other files) rootfs.squashfs image o=
f file system that I am upgrading to, verify md5 checksum of the image.
> 2. Boot linux from a small JFFS2 partition that has a minimal set of tool=
s required to perform upgrade.
> 3. Mount the large partition that must be upgraded.
> 4. Mount rootfs.squashfs which is stored in the big partition.
> 5. Remove all files from the large partition except from some migrated da=
ta files, the rootfs.squashfs image etc.
> 6. Copy all files from mounted rootfs.squashfs to the large partition
> 7. Boot from the large partition
>
> The mentioned power loss occurs in 5. step. Note that the rootfs.squashfs=
 is mounted as read only and is never altered during upgrade. Even though t=
his file gets corrupted and after device is powered on you can see that the=
 file's md5 checksum is different, size stays unchanged, image can be mount=
ed but it is impossible to read some of the files from this image.
>
> Shouldn't JFFS2 deal with this kind of scenario? Is there any way to reco=
ver from this situation?

I'd say "it's complicated". :)

UBIFS was created to deal with such situations.
If you want to be on the safe side, use it.

--=20
Thanks,
//richard
