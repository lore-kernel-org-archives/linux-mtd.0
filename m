Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IV1Mu-0007Yp-Ta
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 04:45:16 -0400
Subject: Re: How to use MTD util: nandwrite
From: Artem Bityutskiy <dedekind@infradead.org>
To: Wanghao.Yu@infineon.com
In-Reply-To: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136E41@xiyse301.ap.infineon.com>
References: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136E41@xiyse301.ap.infineon.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 11 Sep 2007 11:44:59 +0300
Message-Id: <1189500299.14370.110.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-09-11 at 10:51 +0800, Wanghao.Yu@infineon.com wrote:
> I met a problem when I used nandwrite to copy file to NandFlash.
> The command I used is as follows.
> #nandwrite /tmp/hello /dev/mtd0 (copy file named hello to /dev/mtd0)
> The error message is=20
> MEMGETINFO: Inappropriate ioctl for device.
> Before using nandwrite, I have already used "flash_eraseall -j /dev/mtd0"=
 to erase the NandFlash.
> I don't know where the problem is.
> Could anyone help me?

I last tried this a year ago and it worked. But I wouldn't be surprized
if someone broke the utility. So I'd suggest you to debug
nandwrite/kernel.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
