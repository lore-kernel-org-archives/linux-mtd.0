Received: from martinlund.org ([173.255.130.145]
 helo=slmp-550-86.slc.westdc.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPFT-0005qu-SK
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 11:33:49 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37540)
 by slmp-550-86.slc.westdc.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <martin.lund@keep-it-simple.com>) id 1gXPEd-005loG-AK
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 04:32:55 -0700
Received: by mail-oi1-f170.google.com with SMTP id y23so1354897oia.4
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 03:32:55 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <CAFLxGvzp_FmaoADzLG0HnBSJsz45NDU3kH+YPr6eUAzOo4uJrw@mail.gmail.com>
 <TY2PR01MB270060F7EC282F9C7C705D409DA70@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <3417318.kOS8JojacP@blindfold>
 <TY2PR01MB2700C1902D91862C39D966E79DA00@TY2PR01MB2700.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB2700C1902D91862C39D966E79DA00@TY2PR01MB2700.jpnprd01.prod.outlook.com>
From: Martin Lund <martin.lund@keep-it-simple.com>
Date: Thu, 13 Dec 2018 12:32:43 +0100
Message-ID: <CAB7pii3ayyPK=trs=wV_Egs+Lt1GMMeh_g_=D82MNefgqqE00A@mail.gmail.com>
Subject: Re: Questions about ubifs,ubi and mtd?
To: takei744@oki.com
Cc: richard@nod.at, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 13, 2018 at 11:45 AM =E6=AD=A6=E4=BA=95 =E5=85=8B=E6=98=8E <tak=
ei744@oki.com> wrote:
>
> Dear Richard,
>
> We appreciate your precious advice.
> We understood the quality status of kernel 3.2.26.
> From now on, we would like to backport from the latest UBI and UBIFS.
> Do you think that it is enough to backport the next part?
>  - drivers/mtd
>  - drivers/mtd/ubi
>  - fs/ubifs
>

I recommend you first take a close look at the git history of Linux
3.2.26 and onward to see if there are any immediate UBI/UBIFS fixes
available that might relate/solve the issue you are seeing. It might
be an easier path than jumping into a big task like back porting
latest UBI/UBIFS to such an old kernel.

/Martin
