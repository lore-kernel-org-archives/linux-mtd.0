Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSFFQ-0003Sw-Ju
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 05:20:10 +0000
Received: by mail-wm0-x244.google.com with SMTP id v16-v6so12330541wmh.5
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2018 22:19:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d03e8f457821494f951fabac2933bbfe@SIWEX5A.sing.micron.com>
References: <d03e8f457821494f951fabac2933bbfe@SIWEX5A.sing.micron.com>
From: "Sourabh Jain (R&D - Telecom)" <sourabh.jain@matrixcomsec.com>
Date: Mon, 11 Jun 2018 10:49:54 +0530
Message-ID: <CAAR3sxP74UZxBWgEV1091QpU7hP9VyjVioOtCvWW00+TcVw53A@mail.gmail.com>
Subject: Re: Re: UBIFS node corruption issue
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 4, 2018 at 4:39 PM, Bean Huo (beanhuo) <beanhuo@micron.com> wrote:
> Resend seems delivery failed
>
>
>
Hi Bean,
> Eg, what kind of NAND, SLC or MLC, what happened to this NAND before this
> issue?
>
We are using SLC NAND and our system was in the field when the problem occurred.

Hi Richard,
We are a product based company. We have purchased SDK from a
semiconductor vendor. There are so many patches from vendor for that
particular SoC.
So, we can not directly use latest kernel version.
We are using Linux 3.2.54 kernel provided to us along with SDK, Could
you please suggest the most stable kernel version after Linux 3.2.54
kernel version which we can use with the least modifications?

Regards,
Sourabh Jain
