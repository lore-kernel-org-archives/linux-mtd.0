Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuFWW-0003yP-HY
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 03:13:33 +0000
Message-ID: <4E4DD661.5080006@freescale.com>
Date: Fri, 19 Aug 2011 11:20:01 +0800
From: LiuShuo <b35362@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
	<4E4D452C.7050805@parrot.com>
In-Reply-To: <4E4D452C.7050805@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	Li Yang <leoli@freescale.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B408=E6=9C=8819=E6=97=A5 01:00, Matthieu CASTET =E5=86=
=99=E9=81=93:
> b35362@freescale.com a =C3=A9crit :
>> From: Liu Shuo<b35362@freescale.com>
>>
>> Freescale FCM controller has a 2K size limitation of buffer RAM. In or=
der
>> to support the Nand flash chip whose page size is larger than 2K bytes=
,
>> we divide a page into multi-2K pages for MTD layer driver. In that cas=
e,
>> we force to set the page size to 2K bytes. We convert the page address=
 of
>> MTD layer driver to a real page address in flash chips and a column in=
dex
>> in fsl_elbc driver. We can issue any column address by UA instruction =
of
>> elbc controller.
>>
> Why do you need to do that ?
>
> When mtd send you a 4k page, why can't you write it by 2*2k pages write=
 ?
1. It's easy to implement.
2. We don't need to move the data in buffer more times, because we
want to use the HW_ECC.

In flash chip per Page:
----------------------------------------------------------------
| first data | first oob | second data | second oob |
----------------------------------------------------------------

> Even better send the first 2K and then if your controller allow it send=
 the
> remaining 2K without command/address phase.
The elbc controller don't allow that.
I have to send twice Program CMD for writing the whole 4KB data.

>
> Matthieu
>
