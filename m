Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJOJL-0004I2-En
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 10:03:04 +0000
From: Thorsten =?utf-8?q?M=C3=BChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: How stable is jffs2 summarize option?
Date: Tue, 1 Jun 2010 12:03:00 +0200
References: <201005311503.42629.muehlfelder@enertex.de>
	<201006011126.23862.muehlfelder@enertex.de>
	<1275384788.25797.17.camel@macbook.infradead.org>
In-Reply-To: <1275384788.25797.17.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201006011203.00664.muehlfelder@enertex.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 01 June 2010 11:33:08 schrieb David Woodhouse:
> On Tue, 2010-06-01 at 11:26 +0200, Thorsten M=C3=BChlfelder wrote:
> > and what do you think about switching to yaffs2? I know it is developed
> > elsewhere, but it seems to be a good alternative to jffs2+summary and
> > probably switching is easier than to ubifs.
>
> Why would you think that switching to something that isn't part of the
> Linux kernel would be easier than switching to ubifs? That seems... odd.

Because getting yaffs2 source and patching the kernel only was 2 commands a=
nd=20
no single additional tool is needed. Just boot from USB stick and run:
flash_eraseall /dev/mtd1
mount -t yaffs2 /dev/mtdblock1 /mnt/device-root
tar xvf root-filesystem.tar -C /mnt/device-root

;-)
