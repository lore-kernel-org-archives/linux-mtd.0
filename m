Received: from mail-ew0-f210.google.com ([209.85.219.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NtjFy-0007pC-Jb
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2010 15:09:34 +0000
Received: by ewy2 with SMTP id 2so1074936ewy.20
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2010 08:09:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791003090048v5b1108b5oc38ee3618fe76d89@mail.gmail.com>
References: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
	<Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
	<804f0d21003080602m4adabf28p62ca7cf5d09c274b@mail.gmail.com>
	<ce9ab5791003080638v604412fcy7761482892c0d787@mail.gmail.com>
	<804f0d21003080823x730204feg70ea4e9a617b6378@mail.gmail.com>
	<ce9ab5791003082059y7268cc03jb09b550b9008bab1@mail.gmail.com>
	<804f0d21003082348m27adcf0exf1d928a53a84655b@mail.gmail.com>
	<ce9ab5791003090048v5b1108b5oc38ee3618fe76d89@mail.gmail.com>
Date: Mon, 22 Mar 2010 16:09:26 +0100
Message-ID: <804f0d21003220809h6fa04a1qe1867177650df926@mail.gmail.com>
Subject: Re: JFFS2 error messages
From: Arno Steffen <arno.steffen@googlemail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Marco Donadio <mdonadio@gmv.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/3/9 Vimal Singh <vimal.newwork@gmail.com>:
>> =A0-s, --pagesize=3DSIZE =A0 =A0 Use page size (max data node size) SIZE
>> (default: 4KiB)
>> =A0-e, --eraseblock=3DSIZE =A0 Use erase block size SIZE (default: 64KiB=
)
>> =A0-c, --cleanmarker=3DSIZE =A0Size of cleanmarker (default 12)
>>
>> As "-s 4096" gives same result as without "-s" I assume the size is in b=
yte ?!
>> Just to be sure - I have to use 2048 instead of 2112 ?
>
> Yes that's correct. You need to use 2048.
>
> --
> Regards,
> Vimal Singh
>
It seems not to work. I am at a loss.

I don't get rid of this messages like
"Empty flash at 0x009e0f6c ends at 0x009e1000"
after changing something in fs, even when shutdown with halt.

I tested with:
mkfs.jffs2 -lqnp -s 2048 -e 131072 -r /opt/rootfs -o
/mnt/hgfs/share/spv/rootfs.jffs2

My flash is has page sizes of 2112 bytes (2048-byte data). Also the
erasesize given with cat /proc/mtd is
20000 (which is 131072 bytes).

Might this be a mdt driver or configuration problem in my kernel?

Regards
Arno
