Received: from [202.109.126.231] (helo=support-smartpc.com.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U4AI-0002ox-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 11:05:05 +0000
Message-ID: <A56A8E5E02CBD511881800306E002CCA24B20D@mrspdc.mrs.com.cn>
From: =?utf-8?B?eGlhb2xpdS5tYW8g5q+b5puJ5p+z?= <xiaoliu.mao@mic.com.tw>
To: 'David Woodhouse' <dwmw2@infradead.org>, Ramya Ravichandran
	 <rrhsin@yahoo.co.in>
Cc: linux-mtd@lists.infradead.org
Subject: =?utf-8?B?562U5aSNOiBDZiBDYXJkIHZzIERpc2tPbkNoaXAg?=
Date: Fri, 25 Jan 2002 19:15:26 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Doc surely is a good choice. Our team had made a fully embedded linux =
system
on it , it works ok.=20

-----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: David Woodhouse =
[mailto:dwmw2@infradead.org]
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =
2002=E5=B9=B41=E6=9C=8825=E6=97=A5 18:53
=E6=94=B6=E4=BB=B6=E4=BA=BA: Ramya Ravichandran
=E6=8A=84=E9=80=81: linux-mtd@lists.infradead.org
=E4=B8=BB=E9=A2=98: Re: Cf Card vs DiskOnChip=20



rrhsin@yahoo.co.in said:
>=20
>    I am a newbie  developing a embedded linux controller for an
> industrial environment. I am unable to decide whether to use a =
Compact
> Flash card or DiskOnChip.With 128MB I need to get the whole thing
> running. Can someone plese tell me as which one to use and why?=20

People have reported severe reliability problems with CF cards. With =
the=20
DiskOnChip, all the translation stuff to emulate a block device is done =
in=20
software, which is probably a better option.

The downside of the DiskOnChip is that the Linux driver doesn't do wear =

levelling, although it's easy enough to add, and that the vendor's =
driver=20
is a binary-only module and hence of dubious legality.

I would go for the DiskOnChip and add wear levelling support - all you =
need=20
to do it make it randomly pick a clean block for erasure occasionally, =
to=20
make sure stuff moves around over time.


--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
