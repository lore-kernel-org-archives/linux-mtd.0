Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMppq-0002Va-Fd
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 21:30:38 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Lauren Del Giudice" <lauren@wyplay.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 21 Dec 2009 13:30:20 -0800
Subject: RE: UBI - exclude bootloader blocks from wear levelling
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
In-Reply-To: <4B2FA658.6010407@wyplay.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wear levelling is done across a "ubi device" (not the whole nand device) wh=
ich is associated with a mtd partition. Your bootloader and kernel mtd part=
itions will not be wear levelled, only your ubi file system partitions. i.e=
. ubi doesn't know about non-ubi mtd partitions.

I think that's the gist of it.

Darwin



-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Lauren Del Giudice
Sent: Monday, December 21, 2009 8:46 AM
To: linux-mtd@lists.infradead.org
Subject: UBI - exclude bootloader blocks from wear levelling

I'm new to UBI... I understood that static wear levelling is applied
accross the whole device (a NAND device in my case); If so, how can
I exclude blocks reserved for the bootloader from wear levelling?

Thanks for your help,
Lauren.
----
This message contains confidential information and may contain information =
that is legally privileged.  If you have received this message by mistake, =
please immediately notify us and delete the original message. Thank you. =20

Ce message contient des informations confidentielles.  S'il vous est parven=
u par erreur, merci de bien vouloir nous en aviser par retour, de n'en fair=
e aucun usage et de n'en garder aucune copie.
----

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
