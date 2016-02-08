Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSs40-0001Om-AX
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2016 20:05:37 +0000
Received: by mail-wm0-x22b.google.com with SMTP id g62so147929778wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 08 Feb 2016 12:05:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160208192111.GA62607@google.com>
References: <CACna6rxZCkeCijReQDSr2Jc7m8q0J7qp=nhNgnkFFzk312wSdg@mail.gmail.com>
 <CACna6rz9ppFXqhh6=m7cnmQ58y=4w4X8f_DM_8Y0ePZ71BoL3g@mail.gmail.com>
 <CAC=U0a1vj1020X8BjvYGSOi7GrJCAad3A8wCeosuEo+7i4Rk3A@mail.gmail.com>
 <20160208192111.GA62607@google.com>
Date: Mon, 8 Feb 2016 15:05:14 -0500
Message-ID: <CAC=U0a0VSUxDPDEi16A_RvbkE89KUDtQjOj3K+d9GTxrbJxULQ@mail.gmail.com>
Subject: Re: brcmnand (iproc): bitflips and ECC errors due to ignored ECC
 config
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

Current driver  defaults to using hamming when we see 1 bit ecc strength.

"It kinda sounds like Rafal is suggesting this product uses 1-bit BCH."

That explains the read errors, if the image that is being read back
was written with 1-bit BCH encoding.

"Unfortunately, we don't really have a way to clearly differentiate 1-bit
Hamming and 1-bit BCH in DT, do we?"

Yes hamming is a special case in that sense. Adding an optional
"ecc_algo"  field would help.
If Rafal has the ability to  create an image with BCH-2 through BCH-8
that can also work on this part. However the current issue needs to
get fixed to have 1-bit hamming along side 1-bit BCH support. And
maybe we default to using BCH, unless hamming is chosen for 1-bit.

Kamal

On Mon, Feb 8, 2016 at 2:21 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Feb 08, 2016 at 02:15:16PM -0500, Kamal Dasu wrote:
>> When SECTOR_SIZE = 512B, SPARE_AREA_SIZE  = 16, ECC_LEVEL = 15 enables
>> 1-bit Hamming ECC protection. So the ecc_level field is the SoC
>> internal representation for 1-bit hamming. If you mean by "removing
>> handling" you made strength=ecc_level=1, then you are now using 1-bit
>> BCH.
>
> It kinda sounds like Rafal is suggesting this product uses 1-bit BCH.
> I didn't even remember such a thing existed on this controller.
> Unfortunately, we don't really have a way to clearly differentiate 1-bit
> Hamming and 1-bit BCH in DT, do we? Both could equally well be described
> by:
>
>         nand-ecc-strength = <1>;
>         nand-ecc-step-size = <512>;
>
> Maybe we need a custom BRCM property?
>
> Brian
