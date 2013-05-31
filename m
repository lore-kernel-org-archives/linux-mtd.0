Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UiREy-0004r3-0o
 for linux-mtd@lists.infradead.org; Fri, 31 May 2013 15:27:40 +0000
Received: by mail-ie0-f175.google.com with SMTP id tp5so4300596ieb.20
 for <linux-mtd@lists.infradead.org>; Fri, 31 May 2013 08:27:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
References: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 31 May 2013 17:26:59 +0200
Message-ID: <CACQ1gAis_qrt_7RTROw-Hbueiy0XKYwtyR56w2DkajVKvwwwHA@mail.gmail.com>
Subject: Re: UBI torture_peb() bad block detection problem
To: Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/4/27 Qiang Yu <yuq825@gmail.com>:
> Hi guys,
>
> I'm writing MTD driver for Allwinner A10 nand controller. Now there is
> a problem with the UBI torture_peb() function. From the code and UBI
> doc, a PEB will be treated as bad when read with bit-flip after erase.
> But with SAMSUNG K9GBG08U0A flash chip, sometimes the bit-flip does
> happen even after being erased.
>
> My question is why make this a rule to detect bad block in
> torture_peb()? A PEB won't have bit-flip when just being erased?

Hi !
As I have also a cubieboard, I would happily have a look at your
driver and test it !

Richard.
