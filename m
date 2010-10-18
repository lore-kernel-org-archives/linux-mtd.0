Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7pyS-000629-3t
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 13:42:02 +0000
Received: by qwj8 with SMTP id 8so595102qwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 06:41:57 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20101018114104.GC15440@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
	<AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
	<20101018114104.GC15440@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 18 Oct 2010 15:41:34 +0200
Message-ID: <AANLkTimcpMb6-VykL0jSsocVF4z19TLMUi4c6dvvbNtF@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, taliaferro62@gmail.com,
	yidong zhang <zhangyd6@gmail.com>, David.Woodhouse@intel.com,
	yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/10/18 Wolfram Sang <w.sang@pengutronix.de>:
>> =C2=A0 =C2=A0The 39VF*-B-Version flashes in the cfi_nopri_fixup_table do=
n't work
>> well in the current code. =C2=A0Because of the mistaken use of
>> command(0x30) in the 6th bus cycle, which should be 0x50. I think the
>> 39VF*-B-Version flashes should be removed form the CFI probe mode. Or
>> maybe the erase operation should be changed for the Compatibility.
>
> Or we put in a variable like the unlock-address?

I'm OK with solution, that's what I try to implement atm, but I'm
still looking for the right place to put this variable.


--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
