Received: from cpanel5.proisp.no ([209.85.100.29])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PXrLf-0003eK-Ed
	for linux-mtd@lists.infradead.org; Wed, 29 Dec 2010 08:25:36 +0000
Received: from mail-gy0-f177.google.com ([209.85.160.177]:39503)
	by cpanel5.proisp.no with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <oyvind.harboe@zylin.com>) id 1PXrLU-0002jg-4R
	for linux-mtd@lists.infradead.org; Wed, 29 Dec 2010 09:25:20 +0100
Received: by gyg4 with SMTP id 4so4506089gyg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Dec 2010 00:25:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
Date: Wed, 29 Dec 2010 09:25:19 +0100
Message-ID: <AANLkTimivRigmfgNK8mm+WTXeYALnp+1vwWDc4LuJM6n@mail.gmail.com>
Subject: Re: Faster flash_eraseall for NOR flash
From: =?UTF-8?Q?=C3=98yvind_Harboe?= <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I don't think this feature is going to work very well as-is.

To make this effective in real life, I think I'll have to add in an
option to read in a binary file, which is written to flash after
erase.

Only those erase blocks which changed should be
erased + written.

The cleanmarkers would be written for erase blocks after
the end of the binary file.

This fixes two things: even faster for blocks that don't change,
if the cleanmarker is not supposed to be there for certain
blocks, then it will currently fail.

--=20
=C3=98yvind Harboe

Can Zylin Consulting help on your project?

US toll free 1-866-980-3434 / International +47 51 87 40 27

http://www.zylin.com/zy1000.html
ARM7 ARM9 ARM11 XScale Cortex
JTAG debugger and flash programmer
