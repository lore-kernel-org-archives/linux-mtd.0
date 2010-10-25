Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAIZn-00065i-DT
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 08:38:44 +0000
Received: by fxm15 with SMTP id 15so2003162fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 01:38:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=s1AbuKGALhb6zjbo5KTRaTVY8B2P3-PwnZvsm@mail.gmail.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154030.11097.40767.stgit@dev.siriade.com>
	<AANLkTinTpHtLRU_cXYsvc0EmBCcxDG+e1i9bY1Es7=fp@mail.gmail.com>
	<AANLkTi=s1AbuKGALhb6zjbo5KTRaTVY8B2P3-PwnZvsm@mail.gmail.com>
Date: Mon, 25 Oct 2010 16:38:38 +0800
Message-ID: <AANLkTinRiF4rnrhKDO79Cp9L=3=oS8-fsw6Y-f+x9N9-@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: cfi_cmdset_0002: add CFI detection for SST
	38VF640x chips
From: yidong zhang <zhangyd6@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: fggs@terra.com.br, linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 25, 2010 at 4:09 PM, Guillaume LECERF <glecerf@gmail.com> wrote=
:
> 2010/10/25 yidong zhang <zhangyd6@gmail.com>:
>> The SST38VF640x chips have no Extended Query table. I think we should
>> move them to the
>> =A0cfi_nopri_fixup_table.
>
> According to the datasheet [1], it has.
>
> [1] http://www.sst.com/dotAsset/39749.pdf, table 13

Oh, sorry, my mistake. I tested the patch right now. But it didn't
work, please the logs below.


Amd/Fujitsu Extended Query Table at 0x0040
  Unknown Amd/Fujitsu Extended Query version  .  (0xff/0xff).


> --
> Guillaume LECERF
> GeeXboX developer - www.geexbox.org
>
