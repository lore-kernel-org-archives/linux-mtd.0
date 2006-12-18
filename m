Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GwMkv-00078v-Fj
	for linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 12:58:31 -0500
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.10.64.221]) by
	mail-irva-10.broadcom.com (Postfix) with ESMTP id 12F7C2B0 for
	<linux-mtd@lists.infradead.org>; Mon, 18 Dec 2006 09:58:16 -0800 (PST)
Received: from NT-IRVA-0750.brcm.ad.broadcom.com (nt-irva-0750
	[10.8.194.64]) by mail-irva-12.broadcom.com (Postfix) with ESMTP id
	BB4DF69CA3 for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2006
	09:58:15 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: interrupt locked for 20ms by mtdblockd
Date: Mon, 18 Dec 2006 09:58:14 -0800
Message-ID: <558537CD955C944E8B21036D2570392C014A2AD1@NT-IRVA-0750.brcm.ad.broadcom.com>
From: "Jian Peng" <jipeng@broadcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using 2.6.12 with mtd released at 03/16/2006. Recently, I found out
that interrupt can be locked for 20ms by mtdblockd. Here is how I traced
it.

Run infinite loop

	while (1) {
		usleep(1 * 1000);
		unsigned now =3D gettime();
		if (now > prev && now - prev > 18) {
			printf("got delay of %d milliseconds\n",
now-prev);
		}
		prev =3D now;
	}

And at the same time, run dd to write to /dev/mtdblock0
=20
time dd if=3D/dev/zero of=3D/dev/mtdblock0 bs=3D512 count=3D10000
=20
then, using LTT (Linux trace toolkit), I can identify where the
interrupt lock happen and found out that mtdblockd sometimes can lock
interrupt for 20ms. This is a serious problem since other real time
tasks can not survive if interrupt was locked for so long time. Any
suggestion?
=20
Thanks,
Jian
