Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OygEU-0007cb-DR
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 07:28:43 +0000
Received: by qyk34 with SMTP id 34so2149503qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 00:28:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E73F778B634944A0B8D4333B7BD012E4@THOR>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
Date: Thu, 23 Sep 2010 09:28:40 +0200
Message-ID: <AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
From: Yegor Yefremov <yegorslists@googlemail.com>
To: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> =C2=A0I'm new to this list, so I'm not sure if I'm doing it correctly.
>
> =C2=A0I'm trying to get this chip supported by the 3rd party router firmw=
are I
> use. The developer from this firmware applied latest patches from git but
> console log still says "pflash: cfi_probe failed" and then kernel panic.
>
> =C2=A0I tried to enable some debug without success.
>
> =C2=A0Any help appreciated

Some time ago I've got this flash chip working with this patch
https://patchwork.kernel.org/patch/32333/. Try enabling JEDEC_PROBE in
your kernel. Unfortunately I don't have such a system now to try this
patch with a newer kernel.

Regards,
Yegor
