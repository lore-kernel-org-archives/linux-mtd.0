Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQfFy-0005vh-1F
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 15:51:46 +0000
Received: by mail-wi0-f173.google.com with SMTP id f8so6413119wiw.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 08:51:23 -0700 (PDT)
Date: Thu, 20 Mar 2014 15:51:19 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v6 36/36] ARM: STi: Add support for the FSM Serial Flash
 Controller
Message-ID: <20140320155119.GG8207@lee--X1>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
 <1395307268-12721-37-git-send-email-lee.jones@linaro.org>
 <20140320112703.GS31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140320112703.GS31517@norris-Latitude-E6410>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Angus.Clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Here we add the necessary device nodes required for successful device
> > probing and Pinctrl setup for the FSM.
> > 
> > Acked-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> > Acked-by Angus Clark <angus.clark@st.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  arch/arm/boot/dts/stih416-pinctrl.dtsi | 13 +++++++++++++
> >  arch/arm/boot/dts/stih416.dtsi         | 13 +++++++++++++
> >  arch/arm/boot/dts/stih41x-b2020.dtsi   |  1 +
> >  arch/arm/boot/dts/stih41x-b2020x.dtsi  | 28 ++++++++++++++++++++++++++++
> >  4 files changed, 55 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/stih41x-b2020x.dtsi

[...]

> > +	soc {
> > +		spifsm: spifsm@fe902000 {
> > +			#address-cells = <1>;
> > +			#size-cells    = <1>;
> > +
> > +			status = "okay";
> > +
> > +			partition@0 {
> > +				label = "Serial Flash 1";
> 
> Are you sure you want spaces in the partition label? I suppose MTD can
> probably handle this fine, but it doesn't seem standard, and it may
> prevent you from using the partition name in certain ways. For instance,
> it might make it harder to use with the "ubi.mtd=" module parameter.
> 
> But otherwise:
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Code fixed and Ack applied.

Thanks Brian.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
