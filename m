Received: from eu1sys200aog118.obsmtp.com ([207.126.144.145])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TsRdz-0004Kx-Ry
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2013 05:22:37 +0000
Message-ID: <50EBAD0E.9000806@st.com>
Date: Tue, 8 Jan 2013 10:52:22 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Missing DT code in FSMC driver?
References: <CACRpkdYp1Aok5rgyavq_o_P6eA7tZJE-F2vx+70go40yev=pdQ@mail.gmail.com>
In-Reply-To: <CACRpkdYp1Aok5rgyavq_o_P6eA7tZJE-F2vx+70go40yev=pdQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stefan Roese <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/6/2013 2:43 AM, Linus Walleij wrote:
> Hi Vipin,
>

Hi Linus,

Happy new year

> I just found this in the SPEAr devicetree for FSMC:
>
> (...)
> 	reg-names = "fsmc_regs", "nand_data", "nand_addr", "nand_cmd";
> 	st,mode =<2>;
> 	status = "okay";
> (...)
>
> st,mode?
>
> I guess this is for setting e.g. DMA mode, but there is no code for parsing
> this in the current FSMC driver, so it seems the device tree is out of sync
> with the code in the driver.
>

Yes, I notice it now.
I would send few patches. I have been sitting on them for quite long now :(

> Also there seems to be no bindings for setting the timings from device
> tree.
>

Would correct these as well

> Do you want me to look into this or do you have code waiting to be
> submitted? (I would guess you have some code since you have added
> that property to the device tree...)
> Documentation/devicetree/bindings/mtd/fsmc-nand.txt need to be
> fixed too I guess.
>

Let me send out the patch and then we can re-discuss if there is more to 
be done

Regards
Vipin

> Yours,
> Linus Walleij
> .
>
