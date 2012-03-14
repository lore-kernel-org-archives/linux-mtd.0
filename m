Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7k0z-0001og-7o
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 08:57:01 +0000
Received: by yhjj52 with SMTP id j52so1742606yhj.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2012 01:57:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201203140810.10964.sr@denx.de>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1331647621.3595.64.camel@sauron.fi.intel.com>
 <4F603BC0.7050808@st.com> <201203140810.10964.sr@denx.de>
Date: Wed, 14 Mar 2012 09:57:00 +0100
Message-ID: <CACRpkdYOE0JbAoQqLUKro5Q2hRP9BJiJ-cEtXSE=bobCs82iDQ@mail.gmail.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Linus Walleij <linus.walleij@linaro.org>
To: Stefan Roese <sr@denx.de>, Vipin Kumar <vipin.kumar@st.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Armando VISCONTI <armando.visconti@st.com>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 14, 2012 at 8:10 AM, Stefan Roese <sr@denx.de> wrote:
> On Wednesday 14 March 2012 07:33:36 Vipin Kumar wrote:
>> Artem, please suggest how to proceed as there would be conflicts if you
>> try to apply Stefan's patch before my patch-set
>
> I suggest to just drop my patch then, since I still have to rebase it on-top
> of the l2 tree. So easiest is most likely, to apply Vipins's patchset now.

I agree, use Vipin's stuff!

Yours,
Linus Walleij
