Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7R0p-0004Rd-H6
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:39:36 +0000
Received: by yenm10 with SMTP id m10so536806yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 05:39:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
 <1331298422.29445.23.camel@sauron.fi.intel.com>
 <4F5A181D.1080106@st.com>
 <1331305901.29445.39.camel@sauron.fi.intel.com>
 <4F5F1931.7060602@st.com>
 <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
Date: Tue, 13 Mar 2012 13:39:32 +0100
Message-ID: <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Linus Walleij <linus.walleij@linaro.org>
To: Armando Visconti <armando.visconti@st.com>,
 Vipin KUMAR <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dbaryshkov@gmail.com, Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 13, 2012 at 12:56 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, Mar 13, 2012 at 10:53 AM, Armando Visconti
>
>> Actually I checked better and I can say that:
>>
>> =A01. We do have the provision to pass the partitions thru pdata and
>> =A0 =A0 cmdline

Oh. no, wait. The driver is broken, I just realized:
commit 0d04eda1430e9a796214bee644b7e05d99cfe613
"mtd: fsmc_nand.c: use mtd_device_parse_register" broke
the ability to pass in partitions from platform data and I did
not realize until now. :-/

> (...) and I get the default partitions from some SPEAr platform
> currently,

This is just because of the above bug.

I'll fix!

Yours,
Linus Walleij
