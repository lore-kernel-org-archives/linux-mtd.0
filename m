Received: from mail-ie0-f182.google.com ([209.85.223.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WiiCv-0002QZ-Ds
 for linux-mtd@lists.infradead.org; Fri, 09 May 2014 10:39:14 +0000
Received: by mail-ie0-f182.google.com with SMTP id tp5so3868276ieb.41
 for <linux-mtd@lists.infradead.org>; Fri, 09 May 2014 03:38:51 -0700 (PDT)
Date: Fri, 9 May 2014 11:38:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC 13/47] mtd: nand: stm_nand_bch: provide Device Tree support
Message-ID: <20140509103846.GS5767@lee--X1>
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

> >Ah, I see.  I will fixup, thanks for the explanation.
> >
> 
> Please wait, I'll review your [v2] series also, then you can further
> send all fixes together. I'm bit caught in other commitments for 3.16,
> so hopefully I'll be able to review your patches by next week.

I have already fixed up, but I won't resubmit until you have
reviewed.

FYI: I have made some changes since v2 including moving over to the
recently submitted core timing structure submitted by Boris Brezillon
and removal bitflip_threshold as an internal variable.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
