Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0uuN-00058V-SU
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 20:09:29 +0000
Received: by mail-ot0-x22f.google.com with SMTP id r30-v6so177387otr.2
 for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2018 13:09:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1802121206440.1158@nanos.tec.linutronix.de>
References: <20180212105642.8662-1-lionel.debieve@st.com>
 <20180212105642.8662-2-lionel.debieve@st.com>
 <alpine.DEB.2.21.1802121206440.1158@nanos.tec.linutronix.de>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 27 Mar 2018 22:09:14 +0200
Message-ID: <CA+M3ks4RMeicX_AAPVwPgULTEg3nbHrm9bkj7ev3XX1No2OQvQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: Update ubi-media.h to dual license
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Lionel Debieve <lionel.debieve@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, joel@clambassador.com,
 Richard Weinberger <richard@nod.at>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org,
 haver@linux.vnet.ibm.com, u.kleine-koenig@pengutronix.de,
 schwarzerf@gmail.com, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2018-02-12 12:08 GMT+01:00 Thomas Gleixner <tglx@linutronix.de>:
> On Mon, 12 Feb 2018, Lionel Debieve wrote:
>
>> Update license template using SPDX. Move the global layout
>> of UBI headers to dual license helping UBI to be the standard
>> solution for raw NAND management.

Hi Frank,

May I ask you your point of view on this license evolution ?

Regards,
Benjamin

>
> No objections from my side, but you really need to poke IBM about that. And
> if that happens then the kernel header. where this is copied from needs to
> be updated as well....
>
> Thanks,
>
>         tglx
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
