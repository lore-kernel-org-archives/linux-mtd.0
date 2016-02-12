Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUCUX-0004XJ-0H
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 12:06:29 +0000
Received: by mail-io0-x22d.google.com with SMTP id 9so89608132iom.1
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 04:06:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC=U0a0VSUxDPDEi16A_RvbkE89KUDtQjOj3K+d9GTxrbJxULQ@mail.gmail.com>
References: <CACna6rxZCkeCijReQDSr2Jc7m8q0J7qp=nhNgnkFFzk312wSdg@mail.gmail.com>
 <CACna6rz9ppFXqhh6=m7cnmQ58y=4w4X8f_DM_8Y0ePZ71BoL3g@mail.gmail.com>
 <CAC=U0a1vj1020X8BjvYGSOi7GrJCAad3A8wCeosuEo+7i4Rk3A@mail.gmail.com>
 <20160208192111.GA62607@google.com>
 <CAC=U0a0VSUxDPDEi16A_RvbkE89KUDtQjOj3K+d9GTxrbJxULQ@mail.gmail.com>
Date: Fri, 12 Feb 2016 13:06:07 +0100
Message-ID: <CACna6rz=0CEE_S_JPX8Nvxzdk5A_0X2ScFg-kGphsC6aMf_m7Q@mail.gmail.com>
Subject: Re: brcmnand (iproc): bitflips and ECC errors due to ignored ECC
 config
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
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

On 8 February 2016 at 21:05, Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> "Unfortunately, we don't really have a way to clearly differentiate 1-bit
> Hamming and 1-bit BCH in DT, do we?"
>
> Yes hamming is a special case in that sense. Adding an optional
> "ecc_algo"  field would help.
> If Rafal has the ability to  create an image with BCH-2 through BCH-8
> that can also work on this part. However the current issue needs to
> get fixed to have 1-bit hamming along side 1-bit BCH support. And
> maybe we default to using BCH, unless hamming is chosen for 1-bit.

I can't really change the way bootloader (CFE) works and how it
flashes image to the NAND. So I'm stuck with BCH-1.
