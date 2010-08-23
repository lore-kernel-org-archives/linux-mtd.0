Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnesY-00024k-JF
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 21:48:31 +0000
Received: by vws11 with SMTP id 11so6265914vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 14:48:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4C722FAD.2030501@parrot.com>
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
	<1282465255.16502.52.camel@brekeke>
	<AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
	<4C722FAD.2030501@parrot.com>
Date: Mon, 23 Aug 2010 14:48:27 -0700
Message-ID: <AANLkTi=d5B3sjAPZPEumkZwtGBEqyVTAVwHopShLdwFr@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Kevin Cernekee <cernekee@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=UTF-8
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 23, 2010 at 1:22 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
>> The NAND controllers on certain legacy SoCs are not able to read the
>> ONFI parameter page, even if the flash device itself supports ONFI.
>
> Why ?
> Are there controllers that doesn't allow to send custom command ?

Yes.  The controllers I have here operate at a relatively high level
(read page, write page, erase block).  Part of the reason for this is
because the controller is designed for XIP and DMA - operations where
it is not practical to have the CPU involved in building command
sequences or wiggling ALE/CLE.

Newer versions of the hardware do have the ability to issue custom
commands and perform ONFI queries, but the versions in the field right
now do not.
