Received: from mail-ie0-f180.google.com ([209.85.223.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnTnP-0005Zr-MY
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 13:44:21 +0000
Received: by mail-ie0-f180.google.com with SMTP id tp5so20195153ieb.39
 for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2013 05:43:56 -0800 (PST)
Date: Mon, 2 Dec 2013 13:43:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v3 36/36] ARM: STi: Add support for the FSM Serial Flash
 Controller
Message-ID: <20131202134348.GG31626@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-37-git-send-email-lee.jones@linaro.org>
 <529C858B.1040601@st.com> <20131202132013.GF31626@lee--X1>
 <529C8A99.1020204@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <529C8A99.1020204@st.com>
Cc: angus.clark@st.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 02 Dec 2013, srinivas kandagatla wrote:

> On 02/12/13 13:20, Lee Jones wrote:
> >>> +		/* FSM */
> >>> +		spifsm: spifsm@fe902000{
> >>> +		        compatible         = "st,spi-fsm", "simple-bus";
> >> "simple-bus" is redundant here.
> > 
> > Yes I agree, good spot.
> > 
> > I removed it from the Documentation, but missed this one.
> > 
> > If I remove it, can I add your Ack for the remainder of the patch?
> Yes,
> 
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> 
> You should be aware that arch/arm/boot/dts/stih416-b2105.dts is not in
> mainline yet.

Yes, I am aware of this. Are you queuing patches for it?

> >>> +		        reg                =  <0xfe902000 0x1000>;
> >>> +		        reg-names          = "spi-fsm";
> >>> +		        pinctrl-0          = <&pinctrl_fsm>;
> >>> +
> >>> +			st,syscfg	   = <&syscfg_rear>;
> >>> +		        st,boot-device-reg = <0x958>;
> >>> +		        st,boot-device-spi = <0x1a>;
> >>> +
> >>> +		        status = "okay";
> >>> +		};
> > 
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
