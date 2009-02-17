Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZQO3-0005Kf-NW
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 13:53:27 +0000
Received: by bwz4 with SMTP id 4so4896445bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Feb 2009 05:53:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <VSNLCHNFE002kAy8T0O00059758@VSNLCHNFE002.VSNLXCHANGE.COM>
References: <AcmLVmK1/oaTVQb9TgSHEWz8TV3gow==>
	<VSNLCHNFE002kAy8T0O00059758@VSNLCHNFE002.VSNLXCHANGE.COM>
Date: Tue, 17 Feb 2009 14:53:20 +0100
Message-ID: <d459bb380902170553p3cb22e9dt8934960cdc688792@mail.gmail.com>
Subject: Re: Cowardly refusing to erase blocks on filesystem with no valid
	JFFS2 nodes empty_blocks , can't read superblock
From: Marco Braga <marco.braga@gmail.com>
To: santhoshunnikrishnan@tataelxsi.co.in
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

Hi,

I have exactly the same problem. The problem is in the organization of
the free bytes in the spare area and the way flash_eraseall expects
them to be. I've not had the time to check the issue in every detail,
but this is what I remember from my brief check. In our board ECC
bytes are put near the middle of the 16 byte spare area (we use 3 byte
ecc). The problem is that flash_eraseall do not agree with JFFS2 in
the way to use the remaining 13 bytes. It believes that it can put an
8 byte cleanmark (since 13 bytes are unused), but there is not enough
contiguous space to but an 8 byte cleanmarker. Notice that
flash_eraseall does not support a split cleanmark so it writes a wrong
mark.
When you mount the device erased with flash_eraseall, then JFFS2
complains about this.

Try this (your exact numbers will vary):

# flash_eraseall -j /dev/mtd7
Erasing 16 Kibyte @ 7fc000 -- 99 % complete. Cleanmarker written at 7fc000.

# nanddump -p -s 0x7fc000 -l 1 /dev/mtd7
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 16384, page size 512, OOB size 16
Dumping data starting at 0x007fc000 and ending at 0x007fc001...
0x007fc000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc0a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc0b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc0c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc0d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc0e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc0f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc1a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc1b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc1c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc1d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc1e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x007fc1f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: 85 19 03 20 08 ff ff ff ff ff ff ff ff ff ff ff

Notice that cleanmarker is only 5 bytes long... Because bytes 6,7,8
are used by our ECC code. The problem is that flash_eraseall expects
to write a linear (contiguous) marker.
This is the relevant code:

                        /* Check for autoplacement */
                        if (oobinfo.useecc =3D=3D MTD_NANDECC_AUTOPLACE) {
                                /* Get the position of the free bytes */
                                if (!oobinfo.oobfree[0][1]) {
                                        fprintf (stderr, " Eeep.
Autoplacement selected and no empty space in oob\n");
                                        exit(1);
                                }
                                clmpos =3D oobinfo.oobfree[0][0];
                                clmlen =3D oobinfo.oobfree[0][1];
                                if (clmlen > 8)
                                        clmlen =3D 8;
                        } else {
                                /* Legacy mode */
                                switch (meminfo.oobsize) {
                                        case 8:
                                                clmpos =3D 6;
                                                clmlen =3D 2;
                                                break;
                                        case 16:
                                                clmpos =3D 8;
                                                clmlen =3D 8;
                                                break;
                                        case 64:
                                                clmpos =3D 16;
                                                clmlen =3D 8;
                                                break;
                                }
                        }

Both methods are basically wrong.

2009/2/10  <santhoshunnikrishnan@tataelxsi.co.in>:
>
> Hi all,
>
>   I am having a problem in using with flash_erasell -j and mount commands
> together.
>
> I erased one NAND partition using the command "flash_eraseall -j /dev/mtd=
1"
>
> The erase was successfully completed and the clean up marker were written
> (as per the prints , i am saying this)
>
> Then i tried to mount the erased partition using the command "mount -t jf=
fs2
> /dev/mtdblock1 /mnt"
>
> but i got one error message saying that
>
> "Cowardly refusing to erase blocks on filesystem with no valid JFFS2 node=
s
> empty_blocks 8, bad_blocks 0, c->nr_blocks 48
> mount: /dev/mtdblock1: can't read superblock"
>
> I tried to erase the flash using the command "flash_eraseall /dev/mtd1"
>
> and then i tried to mount the erased partition using the command "mount -=
t
> jffs2 /dev/mtdblock1 /mnt"
>
> This time it successfully mounted and i am able to write contents to the
> partition.
>
> I want to know why i am not able to mount after erasing the flash using t=
he
> -j option. I know that -j is to write the cleanup marker and the MTD site
> recommands erasing the flash with this "-j"
>
> Can anyone help me what the problem is ?
>
>
> Regards,
> Santhosh Unnikrishnan
>
>
> The information contained in this electronic message and any attachments =
to this message are intended for the exclusive use of the addressee(s) and =
may contain proprietary, confidential or privileged information. If you are=
 not the intended recipient, you should not disseminate, distribute or copy=
 this e-mail. Please notify the sender immediately and destroy all copies o=
f this message and any attachments contained in it.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
