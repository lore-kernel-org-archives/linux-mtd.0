Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7QLR-0005UU-Ls
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 11:56:50 +0000
Received: by yhjj52 with SMTP id j52so484568yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 04:56:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F5F1931.7060602@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
 <1331298422.29445.23.camel@sauron.fi.intel.com>
 <4F5A181D.1080106@st.com>
 <1331305901.29445.39.camel@sauron.fi.intel.com>
 <4F5F1931.7060602@st.com>
Date: Tue, 13 Mar 2012 12:56:47 +0100
Message-ID: <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Linus Walleij <linus.walleij@linaro.org>
To: Armando Visconti <armando.visconti@st.com>,
 Vipin KUMAR <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>,
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

On Tue, Mar 13, 2012 at 10:53 AM, Armando Visconti
<armando.visconti@st.com> wrote:

> Actually I checked better and I can say that:
>
> =A01. We do have the provision to pass the partitions thru pdata and
> =A0 =A0 cmdline
> =A02. Nevertheless, we are not passing partitions thru pdata in none
> =A0 =A0 of our platforms.
>
> I think we need to change this and pass partitions thru pdata.

This would be cleaner, actually I am using the same driver on the
U300 (also for Nomadik the day I find some time to adopt it)
and I get the default partitions from some SPEAr platform
currently, I think I should rather get some warning message from
the driver or MTD core like "you haven't defined any partitions".

Linus Walleij
