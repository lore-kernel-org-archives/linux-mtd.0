From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/10] mtd: st_spi_fsm: Provide mask to obtain correct
 boot device pins
Date: Thu, 22 May 2014 13:47:07 +0200
Message-ID: <4231397.Nn7Rm5jh2O@wuerfel>
In-Reply-To: <1400757848-18075-10-git-send-email-lee.jones@linaro.org>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
 <1400757848-18075-10-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Christophe Kerello <christophe.kerello@st.com>, computersforpeace@gmail.com,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 22 May 2014 12:24:07 Lee Jones wrote:
> +       /* Mask to apply on boot_device_reg */
> +       ret = of_property_read_u32(np, "st,boot-device-msk", &boot_device_msk);
> +       if (ret)
> +               goto boot_device_fail;
> +
> 

The binding defines this property as "optional", but the driver fails
here if it's not provided. I suggest you add a default value here so you
can deal with existing dts. The default should be documented in
the binding as well.

	Arnd
