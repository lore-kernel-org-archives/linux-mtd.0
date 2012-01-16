Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmlzp-00054g-2h
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:49:09 +0000
Received: by iakl21 with SMTP id l21so10351566iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 04:49:08 -0800 (PST)
Message-ID: <1326718253.14299.82.camel@sauron.fi.intel.com>
Subject: Re: Corrupted UBIFS, bad CRC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Date: Mon, 16 Jan 2012 14:50:53 +0200
In-Reply-To: <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
 <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
 <1326709475.14299.34.camel@sauron.fi.intel.com>
 <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RdbpGTPo4W1n/AfJBrwd"
Mime-Version: 1.0
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RdbpGTPo4W1n/AfJBrwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To recap the most important things - but refer to my todays reply
anyway.

1. Pick printing fixes from ubifs-v3.2
2. Find out what UBIFS tells about your max_write_size
3. Check your _real_ buffer size from your flash docs and the driver and
verify that it is correct.
4. My theory that you should have 256 ore larger NOR flash write buffer
size.
5. With the hack I sent I can mount successfully. To verify my theory
you can test with this hack and see if you can reproduce the problem. If
you can, then either write-buffer is larger than 256 or my theory is
incorrect.

BTW, here is what I used to test your image in mtdram, just for
reference:

$ sudo dmesg -c > /dev/null && sudo ./unload_all.sh && sudo modprobe mtdram=
 total_size=3D29440 && sudo dd if=3D~/tmp/Karsten/corrupt_mtd4_20120116.img=
 of=3D/dev/mtd0 && sudo modprobe ubi mtd=3D0 && sudo modprobe ubifs && sudo=
 sh -c 'echo "format \"UBIFS DBG\" +p" > /sys/kernel/debug/dynamic_debug/co=
ntrol' && sudo mount -t ubifs /dev/ubi0_0 /mnt/ubifs

Yeah, I know it is long and ugly, I wrote it on-the-spot to quickly
debug your issue. If you need, you can decompose it.

--=20
Best Regards,
Artem Bityutskiy

--=-RdbpGTPo4W1n/AfJBrwd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFB0tAAoJECmIfjd9wqK0400P/3cuXqD1QFEn2FQd8v6QNRzg
2wtIRqNtxsN4N/BpIWUHcl049PhFR6l0etm23lHpg/PjUJcOVsaGtm1NoVnsQTHL
37+IN4f10S+mHXqQMgVW2afgO6oehDqbjf4ym+EEvBZ2jbS//J3ei/RKId5PdOLI
d/dLYfMCLnLJjjop3KKq2tSKodwL7AZrI2rMDdIv6zECgOxyypgl6W+NDmUipWXL
7yYODUEidtptUB55gcudMfqnKy/kr8NthNRoozMFH6gy+6huE2qtjgt2bJ6k1FIp
blEeoLeaNbwNZEs28+xXdoa/RAM6ftzoGU+XLa1FFI7O5ScRyjqxTRpXTU80g1Ye
f9sBSmJkNZNUHW6tRUAOL9J6ViN0IV7VqhPkP+YuZLMgDiRUkymyXstC0bEdlu1R
yGKuWbpG9IWY82ee61vuCMfNcTViJXCN8qKavO4fp7OeLEMXKxHsRuLhUBD7USka
6oAMBq69s+nHIBbTMhpYjuE7FRz++iH+a0pl/7YXy5zluwE5z/lHAm9rEJmovQSA
PlJQFuMOQRl+iuI5uR64Taj+rIOm+kxGVNi7jBABhWpQ4sVmNiR3gWdqh7sHlUX2
x1fYMFkT5v867H/ilW1szJNm4ykuLXuCq+XgIbeOZdx3VHG4BEYxjCg7JTdZs9A3
EUV+r9wSoM8pUjZaNDEV
=adfS
-----END PGP SIGNATURE-----

--=-RdbpGTPo4W1n/AfJBrwd--
