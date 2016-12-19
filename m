Subject: Re: [PATCH] mtd: nand: fsmc: remove stale non-DT probe path
To: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1482060895-26838-1-git-send-email-linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Vipin Kumar <vipin.kumar@st.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <417a2f4f-7ef0-72c9-fa9c-223b40c0bda3@denx.de>
Date: Mon, 19 Dec 2016 07:15:15 +0100
MIME-Version: 1.0
In-Reply-To: <1482060895-26838-1-git-send-email-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18.12.2016 12:34, Linus Walleij wrote:
> The FSMC driver has an execution path and a header file in
> <linux/mtd/fsmc.h> that serves to support passing in platform
> data through board files, albeit no upstream users of this
> mechanism exist.
>
> The header file also contains function headers for functions that
> do not exist in the kernel.
>
> Delete this and move the platform data struct, parsing and
> handling into the driver, assume we are using OF and make the
> driver depend on OF, remove the ifdefs making that optional.
>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Stefan Roese <sr@denx.de>
> Cc: Vipin Kumar <vipin.kumar@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
