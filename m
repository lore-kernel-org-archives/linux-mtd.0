Received: from mail-ob0-f171.google.com ([209.85.214.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vnp0K-0001xJ-Am
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2013 12:23:05 +0000
Received: by mail-ob0-f171.google.com with SMTP id wp18so14277541obc.2
 for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2013 04:22:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131203113156.GB12031@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-15-git-send-email-lee.jones@linaro.org>
 <CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
 <20131202110304.GB31626@lee--X1>
 <CACRpkdb8=RRsNRKe4Nbefu2BJ4xHakmNjxFC1gwLea=bAmOz-A@mail.gmail.com>
 <20131203113156.GB12031@lee--X1>
Date: Tue, 3 Dec 2013 13:22:37 +0100
Message-ID: <CACRpkdYdW+p4-sDNCr8L75YB+e6agiQfvfEX5V+wCs4iZUaKSQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/36] mtd: st_spi_fsm: Add device-tree binding
 documentation
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 angus.clark@st.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 3, 2013 at 12:31 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 03 Dec 2013, Linus Walleij wrote:

>> So it can be in <linux/mfd/my-sysconfig-regs.h> as
>> a
>>
>> #define MY_SYSCON_V1_BOOT_DEV_REG 0x958
>> #define MY_SYSCON_V1_BOOT_DEV_SPI 0x1a
>>
>> The kernel should know which SoC is in use and
>> act apropriately right?
>
> And this have lots of machine_is() calls everywhere?

No need for Mr. Everywhere to know about the SoC.

There are other ways to achieve this. arch/arm/mach-foo
always knows which ASIC it is running on, and it can do
various things:

- Add device tree fragments/overlays (OK high-tech, but
  we're getting to this, inevitably)

- Selectively add AUXDATA, which is absolutely OK if
  we can do autoprobing of hardware IMO.

Yours,
Linus Walleij
