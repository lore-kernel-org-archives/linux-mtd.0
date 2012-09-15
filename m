Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCkux-0001aa-Fv
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 05:27:48 +0000
Received: by lagu2 with SMTP id u2so3104893lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2012 22:27:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F8E72B3.1090205@freescale.com>
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>
 <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
 <4F86416B.4090501@freescale.com>
 <CAN8TOE_yhvB+xnyS_UZn0ko+QySFZJsYBk5w0PB_O37eZaQj9g@mail.gmail.com>
 <4F8E72B3.1090205@freescale.com>
Date: Fri, 14 Sep 2012 22:27:42 -0700
Message-ID: <CAN8TOE9a7vF0D8hGFubLdg+wQAzA2H+mF_QKawnLEj=rj7GumQ@mail.gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

Sorry (again) that this is sitting for a while. I did some more work
this evening on it, and I think I could have a solution. But I still
don't have any real samples, so I'd like you help.

On Wed, Apr 18, 2012 at 12:52 AM, Huang Shijie <b32955@freescale.com> wrote=
:
> =D3=DA 2012=C4=EA04=D4=C218=C8=D5 13:00, Brian Norris =D0=B4=B5=C0:
> I only have the H27UBG8T2A nand chip in my hand, and test it in the imx28
> board.
> I do not have other nand chips which may also follow the same parsing cod=
e
> as the H27UBG8T2A.

Can you capture a full ID string for any Hynix parts you have?
Especially of interest are this H27UBG8T2A and other MLC.

I want to check the ID length and wraparound behavior, since I think
that we can write a rule such that we use this data table for all
Hynix MLC with 6-byte ID strings. I have info for 3 type of Hynix MLC
that follow the 6-byte pattern, and a few 5-byte Hynix MLC that follow
existing patterns.

I appreciate the help and the patience.

Thanks,
Brian
