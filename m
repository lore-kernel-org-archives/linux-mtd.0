Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NodXm-0002hb-HB
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2010 14:02:54 +0000
Received: by wyf23 with SMTP id 23so3156039wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Mar 2010 06:02:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
References: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
	<Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
Date: Mon, 8 Mar 2010 15:02:48 +0100
Message-ID: <804f0d21003080602m4adabf28p62ca7cf5d09c274b@mail.gmail.com>
Subject: Re: JFFS2 error messages
From: Arno Steffen <arno.steffen@googlemail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Marco Donadio <mdonadio@gmv.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/1/29 Ricard Wanderlof <ricard.wanderlof@axis.com>:
...
> The 'Empty flash at ... ends at ...' usually indicates some sort of misma=
tch
> between the sector or block size of the flash and the erasesize used when
> making the image. It could be harmless, or could indicate a more serious
> configuration problem.
...
> /Ricard
> --
> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 Fax +46 46 13 61 30

I also suffered from this empty flash at ... message.
So I checked with cat /proc/mtd the erasesize (which is 20000) and how
I generated the jffs2 (with mkfs.jffs2 -lqnp -e 128).

Imho this both match (128k). But somewhat has to cause this message.
What else could I do to prevent such messages and how to get rid of it?

Best Regards
Arno
