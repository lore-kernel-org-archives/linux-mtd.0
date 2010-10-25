Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAJrV-00066q-V5
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 10:01:07 +0000
Received: by mail-fx0-f49.google.com with SMTP id 15so2071346fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 03:01:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinyoLrwmu63USS6OQXEuF3YXob95v30hggvvuKx@mail.gmail.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154030.11097.40767.stgit@dev.siriade.com>
	<AANLkTinTpHtLRU_cXYsvc0EmBCcxDG+e1i9bY1Es7=fp@mail.gmail.com>
	<AANLkTi=s1AbuKGALhb6zjbo5KTRaTVY8B2P3-PwnZvsm@mail.gmail.com>
	<AANLkTinRiF4rnrhKDO79Cp9L=3=oS8-fsw6Y-f+x9N9-@mail.gmail.com>
	<AANLkTinyoLrwmu63USS6OQXEuF3YXob95v30hggvvuKx@mail.gmail.com>
Date: Mon, 25 Oct 2010 18:01:04 +0800
Message-ID: <AANLkTik8D4DyTvybO9N6-z2CMXO=mez8KLYyxniKQQg3@mail.gmail.com>
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

On Mon, Oct 25, 2010 at 5:17 PM, Guillaume LECERF <glecerf@gmail.com> wrote=
:
> 2010/10/25 yidong zhang <zhangyd6@gmail.com>:
>> Oh, sorry, my mistake. I tested the patch right now. But it didn't
>> work, please the logs below.
>>
>> Amd/Fujitsu Extended Query Table at 0x0040
>> =A0Unknown Amd/Fujitsu Extended Query version =A0. =A0(0xff/0xff).
>
> This chip does not have a valid Major/MinorVersion.
> Could you please try the attached patch ?

Passed my test. Using this patch, the driver can support the chips now.

>
> --
> Guillaume LECERF
> GeeXboX developer - www.geexbox.org
>
