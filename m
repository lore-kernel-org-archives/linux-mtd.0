Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bthFS-00018r-If
 for linux-mtd@lists.infradead.org; Mon, 10 Oct 2016 20:32:35 +0000
Received: by mail-oi0-f68.google.com with SMTP id d132so54821oib.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2016 13:32:14 -0700 (PDT)
Date: Mon, 10 Oct 2016 15:32:12 -0500
From: Rob Herring <robh@kernel.org>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Wim Van Sebroeck <wim@iguana.be>, Jean Delvare <jdelvare@suse.com>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>,
 JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/7] Introduce PTX1K Boot FPGA driver
Message-ID: <20161010203212.GA10128@rob-hp-laptop>
References: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 07, 2016 at 06:21:57PM +0300, Pantelis Antoniou wrote:
> Add Juniper's PTX1K Boot FPGA driver. Those FPGAs
> are present in Juniper's PTX series of routers.
> 
> The MFD driver provices watchdog/mtd/hwmon devices.
> 
> There are full device tree binding documents for the
> master mfd driver and for the slave driver.
> 
> This patchset is against mainline as of today: v4.8-9431-g3477d16
> and is dependent on the "Juniper prerequisites" and
> "Juniper infrastructure" patchsets sent earlier.

You've exceeded the number of patches I'm willing to review at once for 
one person and I'm tired of making the same comments. So fix anything 
I've already mentioned elsewhere and send this series again.

Rob
