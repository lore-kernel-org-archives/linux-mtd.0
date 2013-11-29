Received: from mail-ob0-f169.google.com ([209.85.214.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmTPc-0000Nj-QT
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 19:07:37 +0000
Received: by mail-ob0-f169.google.com with SMTP id wm4so10406549obc.14
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 11:07:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1385727565-25794-15-git-send-email-lee.jones@linaro.org>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-15-git-send-email-lee.jones@linaro.org>
Date: Fri, 29 Nov 2013 20:07:11 +0100
Message-ID: <CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
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

On Fri, Nov 29, 2013 at 1:19 PM, Lee Jones <lee.jones@linaro.org> wrote:

Re this:

> +Optional properties:
> +  - st,syscfg          : Phandle to boot-device system configuration registers
> +  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
> +  - st,boot-device-spi : Expected boot-device value if booted via this device
> +
> +Example:
> +       spifsm: spifsm@fe902000{
> +               compatible         = "st,spi-fsm";
> +               reg                =  <0xfe902000 0x1000>;
> +               reg-names          = "spi-fsm";
> +               pinctrl-0          = <&pinctrl_fsm>;
> +               st,syscfg          = <&syscfg_rear>;
> +               st,boot-device-reg = <0x958>;
> +               st,boot-device-spi = <0x1a>;

I don't think we should encode any register offsets whatsoever in device
tree but maybe that's just me. (Yes, Stephen will beat me up about
pin control single, but I consider that a special case.)

I would just put the last two things as #defines into the driver file(s)
or - if it's related to other syscfg registers and varies with SoC incarnation,
as a #define in a shared header for that syscfg thing.

The syscfg phandle is elegant though, really like that.

Yours,
Linus Walleij
