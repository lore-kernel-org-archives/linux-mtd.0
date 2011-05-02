Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QGn2J-00043i-IX
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 06:55:16 +0000
Date: Mon, 2 May 2011 08:55:10 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Angelo Dureghello <angelo70@gmail.com>
Subject: Re: help request, jffs2 fs files get lost
In-Reply-To: <4DBD4572.5040508@gmail.com>
Message-ID: <Pine.LNX.4.64.1105020853440.15966@lnxricardw.se.axis.com>
References: <4DBD4572.5040508@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 1 May 2011, Angelo Dureghello wrote:

> So from uClinux, i try to prepare the jffs2 fs:
>
> # eraseall /dev/mtd2
> erased 1024 Kibyte @ 0 -- 100% complete.
>
> cat /dev/mtd2    i see the flash has been cleared
>
> then i create a folder "backup" in /var with some files and try to crete =
the jffs2 fs:
>
> mkfs.jffs2 -d backup -o jffs2.img
>
> cp /deV/mtd2 jffs2.img

If this is in fact what you're doing, you're overwriting your jffs2.img=20
file with the all-ff's contents of the newly erased /dev/mtd2. Swap the=20
two arguments instead.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
