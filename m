Received: from mail-ie0-f173.google.com ([209.85.223.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmO9t-00019I-Um
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 14:03:22 +0000
Received: by mail-ie0-f173.google.com with SMTP id lx4so2327158iec.4
 for <linux-mtd@lists.infradead.org>; Mon, 19 May 2014 07:02:55 -0700 (PDT)
Date: Mon, 19 May 2014 15:02:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC 13/47] mtd: nand: stm_nand_bch: provide Device Tree support
Message-ID: <20140519140249.GM4978@lee--X1>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-14-git-send-email-lee.jones@linaro.org>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5C83@DBDE04.ent.ti.com>
 <20140430125406.GN29462@lee--X1>
 <20980858CB6D3A4BAE95CA194937D5E73EACA3F0@DBDE04.ent.ti.com>
 <20140509100304.GR5767@lee--X1>
 <20980858CB6D3A4BAE95CA194937D5E73EACBC8F@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACBC8F@DBDE04.ent.ti.com>
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "kernel@stlinux.com" <kernel@stlinux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >> >> >+	of_property_read_u32(np, "st,bch-bitflip-threshold",
> >> >> >+			     &pdata->bch_bitflip_threshold);
> >> >> >+
> >> >> mtd->bitflip_threshold is by default set to ecc.strength (unless a driver initializes it).
> >> >> And then can be re-configured for each MTD partition separately
> >> >> 	/sys/class/mtd/mtdX/bitflip_threshold
> >> >> 	Refer: $kernel/Documentation/ABI/testing/sysfs-class-mtd
> >> >> So, I don't think this is a HW parameter, and so should not be passed from DT.
> >> >
> >> >I think the bit-flip threshold is/can be chip specific, and as we know
> >> >which chip we're likely to be booting on, we can specify this via the
> >> >hardware description.  Thus, I think it's perfectly viable for an
> >> >option to pass through DT to exist.
> >> >
> >> I don't think that’s the correct interpretation of bitflip_threshold.
> >>
> >> (1) bitflip_threshold is dependent on ecc.strength (ECC scheme) of your driver.
> >> MTD layers uses bitflip_threshold to warn above layers that number of
> >> correctable bit-flips have reached a dangerous level beyond which driver's
> >> ECC scheme may not be able to correct them. So above layers should start
> >> taking additional corrective action like scrubbing.
> >> 	@@drivers/mtd/mtdcore.c: mtd_read()
> >> 		return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
> >>
> >> (2) Also, user-space may control it based on how your device ages on field.
> >> A fresh silicon may not show too many bitflips. But as device ages the
> >> probability of simultaneous bitflips will increase. So user-space may lower
> >> the bitflip_threshold to avoid accumulation of bitflips in a single page.
> >>
> >> Thus, bitflip_threshold should not be passed via DT.
> >> It's neither a hardware parameter, nor it’s a static constant.
> >
> >Ah, I see.  I will fixup, thanks for the explanation.
> 
> Please wait, I'll review your [v2] series also, then you can further
> send all fixes together. I'm bit caught in other commitments for 3.16,
> so hopefully I'll be able to review your patches by next week.

Did you manage to find some time to review the driver at all last week?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
