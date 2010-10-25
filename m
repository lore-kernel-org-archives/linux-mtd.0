Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAI82-00054k-Sp
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 08:10:04 +0000
Received: by gwj17 with SMTP id 17so2581852gwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 01:10:00 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <AANLkTinTpHtLRU_cXYsvc0EmBCcxDG+e1i9bY1Es7=fp@mail.gmail.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154030.11097.40767.stgit@dev.siriade.com>
	<AANLkTinTpHtLRU_cXYsvc0EmBCcxDG+e1i9bY1Es7=fp@mail.gmail.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 25 Oct 2010 10:09:39 +0200
Message-ID: <AANLkTi=s1AbuKGALhb6zjbo5KTRaTVY8B2P3-PwnZvsm@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: cfi_cmdset_0002: add CFI detection for SST
	38VF640x chips
To: yidong zhang <zhangyd6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: fggs@terra.com.br, linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	w.sang@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/10/25 yidong zhang <zhangyd6@gmail.com>:
> The SST38VF640x chips have no Extended Query table. I think we should
> move them to the
> =C2=A0cfi_nopri_fixup_table.

According to the datasheet [1], it has.

[1] http://www.sst.com/dotAsset/39749.pdf, table 13
--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
