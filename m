Received: from mail-ia0-f172.google.com ([209.85.210.172])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Trb3Q-0005Mz-Sw
 for linux-mtd@lists.infradead.org; Sat, 05 Jan 2013 21:13:21 +0000
Received: by mail-ia0-f172.google.com with SMTP id z13so14756587iaz.17
 for <linux-mtd@lists.infradead.org>; Sat, 05 Jan 2013 13:13:18 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 5 Jan 2013 22:13:18 +0100
Message-ID: <CACRpkdYp1Aok5rgyavq_o_P6eA7tZJE-F2vx+70go40yev=pdQ@mail.gmail.com>
Subject: Missing DT code in FSMC driver?
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 vipin.kumar@st.com, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vipin,

I just found this in the SPEAr devicetree for FSMC:

(...)
	reg-names = "fsmc_regs", "nand_data", "nand_addr", "nand_cmd";
	st,mode = <2>;
	status = "okay";
(...)

st,mode?

I guess this is for setting e.g. DMA mode, but there is no code for parsing
this in the current FSMC driver, so it seems the device tree is out of sync
with the code in the driver.

Also there seems to be no bindings for setting the timings from device
tree.

Do you want me to look into this or do you have code waiting to be
submitted? (I would guess you have some code since you have added
that property to the device tree...)
Documentation/devicetree/bindings/mtd/fsmc-nand.txt need to be
fixed too I guess.

Yours,
Linus Walleij
