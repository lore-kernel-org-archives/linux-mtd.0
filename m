Received: from barry.mail.mindspring.net ([207.69.200.25])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AUpqe-0006qL-Nv
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2003 16:09:00 +0000
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 12 Dec 2003 11:08:00 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGKEHPEEAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_00C2_01C3C0A0.3483F770"
Subject: example scripts to save and restore DiskOnChip bad block table
	around a nftl_format operation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_00C2_01C3C0A0.3483F770
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I created some scripts that save/restore the bad block table of my
DiskOnChip device.  This allows me to save the bbt, run nftl_format,
then restore the bbt.

I modified the scripts, which actually worked with 2 DiskOnChip
devices on my target, to only use one device for clarity's sake.
I then added a bunch of comments and annoying disclaimers, etc.
I added lines at the top so you cannot use the scripts without
editing them for your particular target or you will probably
trash your DOC.  So if after all these mods they don't run quite
right, you know why.  I had to deliver the target they ran on
so I can't test them in their modified state.

There is no warranty with these at all.  I send them out since
they worked well for me (at least before I added all the comments,
etc.).  

When I needed such a tool and could not find one, I thought that
after writing them I would send them to the group so someone might
benefit from them as examples.

Chuck Meade
chuckmeade@mindspring.com

------=_NextPart_000_00C2_01C3C0A0.3483F770
Content-Type: application/octet-stream;
	name="bbt_save.sh"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="bbt_save.sh"

#!/bin/sh=0A=
=0A=
# There is no warranty for this whatsoever.  Do not use it without=0A=
# customizing for your target.  If it then causes you problems, then=0A=
# they are your problems.  Worked for me.  I make no claims that it=0A=
# will work on any DiskOnChip device other than mine.  Use for example=0A=
# purposes only.  Any other disclaimers you can think of, apply them too.=0A=
#=0A=
# If it necessary to say that this file is under a license, then it=0A=
# is under the GPL.=0A=
#=0A=
# Copyright 2003 Chuck Meade, chuckmeade@mindspring.com=0A=
#=0A=
=0A=
echo "**You must edit this script and customize it for your target."=0A=
echo "**Until you do so, it will simply exit to prevent you from"=0A=
echo "**mindlessly reusing it.  The numbers here are only examples."=0A=
exit 1=0A=
=0A=
#=0A=
# Run this script before doing the nftl_format operation on the =
DiskOnChip=0A=
# device.  This will save the bad block table in file bbt_mtd4.=0A=
#=0A=
=0A=
# Find media headers.  Search the first 8 8K blocks of /dev/mtd4.=0A=
#=0A=
# NOTE you will have to customize the device in use for your target.=0A=
# NOTE if you do not have 8K blocks, customize that too.=0A=
#=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_1 bs=3D1 count=3D6 skip=3D0=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_2 bs=3D1 count=3D6 skip=3D8192=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_3 bs=3D1 count=3D6 skip=3D16384=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_4 bs=3D1 count=3D6 skip=3D24576=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_5 bs=3D1 count=3D6 skip=3D32768=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_6 bs=3D1 count=3D6 skip=3D40960=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_7 bs=3D1 count=3D6 skip=3D49152=0A=
dd if=3D/dev/mtd4 of=3Dbbtver4_8 bs=3D1 count=3D6 skip=3D57344=0A=
=0A=
ver41=3D$(grep -a ANAND bbtver4_1)=0A=
ver42=3D$(grep -a ANAND bbtver4_2)=0A=
ver43=3D$(grep -a ANAND bbtver4_3)=0A=
ver44=3D$(grep -a ANAND bbtver4_4)=0A=
ver45=3D$(grep -a ANAND bbtver4_5)=0A=
ver46=3D$(grep -a ANAND bbtver4_6)=0A=
ver47=3D$(grep -a ANAND bbtver4_7)=0A=
ver48=3D$(grep -a ANAND bbtver4_8)=0A=
=0A=
rm -f bbtver4_1=0A=
rm -f bbtver4_2=0A=
rm -f bbtver4_3=0A=
rm -f bbtver4_4=0A=
rm -f bbtver4_5=0A=
rm -f bbtver4_6=0A=
rm -f bbtver4_7=0A=
rm -f bbtver4_8=0A=
=0A=
# Save bad block table=0A=
#=0A=
# NOTE the block sizes, counts, and skips, are custom.  The count of 15=0A=
#      blocks of 512 bytes saves a bbt of (8K - 512) bytes.  This may=0A=
#      differ on your target.  This is one example implementation.=0A=
#=0A=
if [ "$ver41" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D1=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver42" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D17=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver43" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D33=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver44" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D49=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver45" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D65=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver46" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D81=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver47" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D97=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
elif [ "$ver48" =3D "ANAND" ]; then=0A=
  dd if=3D/dev/mtd4 of=3Dbbt_mtd4 bs=3D512 count=3D15 skip=3D113=0A=
  echo SUCCESS -- bad block table saved in file 'bbt_mtd4'.=0A=
else=0A=
  echo NOTE: Media headers not found in first 8 blocks in /dev/mtd4=0A=
fi=0A=
=0A=
exit 0=0A=
=0A=

------=_NextPart_000_00C2_01C3C0A0.3483F770
Content-Type: application/octet-stream;
	name="bbt_restore.sh"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="bbt_restore.sh"

#!/bin/sh=0A=
=0A=
# There is no warranty for this whatsoever.  Do not use it without=0A=
# customizing for your target.  If it then causes you problems, then=0A=
# they are your problems.  Worked for me.  I make no claims that it=0A=
# will work on any DiskOnChip device other than mine.  Use for example=0A=
# purposes only.  Any other disclaimers you can think of, apply them too.=0A=
#=0A=
# If it necessary to say that this file is under a license, then it=0A=
# is under the GPL.=0A=
#=0A=
# Copyright 2003 Chuck Meade, chuckmeade@mindspring.com=0A=
#=0A=
=0A=
echo "**You must edit this script and customize it for your target."=0A=
echo "**Until you do so, it will simply exit to prevent you from"=0A=
echo "**mindlessly reusing it.  The numbers here are only examples."=0A=
exit 1=0A=
=0A=
#=0A=
# Run this script after doing the nftl_format operation on the DiskOnChip=0A=
# devices to restore the bad block table.  It uses the file you =
previously=0A=
# saved off using bbt_save.sh.=0A=
#=0A=
=0A=
# After the format, it is assumed that the media headers will be in the=0A=
# first two blocks.  If this is not a safe assumption on your target =
(worked=0A=
# fine for me) then you will have to customize this logic.=0A=
#=0A=
# NOTE this assumes 8K blocks.  This may not apply to your target.=0A=
#      Customize if necessary.=0A=
#=0A=
# Verify /dev/mtd4 media headers at 0x0 and 0x2000=0A=
#=0A=
dd if=3D/dev/mtd4 of=3Dbbtver1 bs=3D1 count=3D6 skip=3D0=0A=
dd if=3D/dev/mtd4 of=3Dbbtver2 bs=3D1 count=3D6 skip=3D8192=0A=
=0A=
ver1=3D$(grep -a ANAND bbtver1)=0A=
ver2=3D$(grep -a ANAND bbtver2)=0A=
=0A=
rm -f bbtver1=0A=
rm -f bbtver2=0A=
=0A=
if [ "$ver1" =3D "ANAND" -a "$ver2" =3D "ANAND" ]; then=0A=
  # Put bbt in media headers at 0x0 and 0x2000 (at 512 byte offset=0A=
  #  into each header)=0A=
  #=0A=
  # NOTE this assumes 8K blocks and may have to be customized if not=0A=
  #      appropriate for your target.=0A=
  # NOTE again that this assumes the media header blocks are the first=0A=
  #      two blocks on the device.  Customize if necessary.=0A=
  #=0A=
=0A=
  # Read media hdr, concat with the bbt, erase the sector to be written,=0A=
  #  then write out the media hdr and bbt sector.=0A=
  dd if=3D/dev/mtd4 of=3Dmhdr4 bs=3D512 count=3D1=0A=
  cat mhdr4 bbt_mtd4 > newsect4=0A=
=0A=
  # Erase the first two blocks of the device.=0A=
  #=0A=
  # NOTE customize this for your target.  Get this right or you will=0A=
  #      not be happy.=0A=
  #=0A=
  ./erase /dev/mtd4 0x0 1=0A=
  ./erase /dev/mtd4 0x2000 1=0A=
=0A=
  dd if=3Dnewsect4 of=3D/dev/mtd4 bs=3D512=0A=
  dd if=3Dnewsect4 of=3D/dev/mtd4 bs=3D512 seek=3D16=0A=
=0A=
  echo SUCCESS -- restored bad block table from file 'bbt_mtd4'.=0A=
else=0A=
  echo ERROR -- /dev/mtd4 Media headers not at 0x0 and 0x2000=0A=
fi=0A=
=0A=
=0A=
exit 0=0A=
=0A=

------=_NextPart_000_00C2_01C3C0A0.3483F770--
