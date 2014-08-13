MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Aug 2014 21:14:14 +0530
From: pekon@pek-sem.com
To: Lee Jones <lee.jones@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/8] mtd: nand: Support for new DT NAND driver
In-Reply-To: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
References: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
Message-ID: <a8fa82ea68d837e52306e6df62f2ed23@pek-sem.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Lee,

On Wednesday 13 August 2014 02:41 PM, Lee Jones wrote:
> Hi Brian, Pekon,
>
> I believe all of your queries have either been answered or addressed
> and I am hoping this will be the last submission. :)
>
> /me crosses fingers!
>
> Kind regards,
> Lee
>
> Lee Jones (8):
>    ARM: multi-v7: Enable ST BCH NAND
>    ARM: sti: Add two new clock definitions for use with ST's NAND
>      controllers
>    ARM: sti: Add BCH (NAND Flash) Controller support for STiH41x 
> (Orly)
>      SoCs
>    ARM: sti: Enable BCH NAND for STiH416 B2020-RevE
>    mtd: nand: stm_nand_bch: provide Device Tree documentation
>    mtd: nand: add shared register defines for ST's NAND Controller
>      drivers
>    mtd: nand: stm_nand_bch: add support for ST's BCH NAND controller
>    mtd: nand: stm_nand_bch: provide ST's implementation of Back Block
>      Table
>

Couldn't review the last [Patch 8/8] for ST's BBT implementation as
I'm not familiar with it. But other patches look good. So for them

Reviewed-By: Pekon Gupta <pekon@pek-sem.com>


with regards, pekon


------------------------
Powered by BigRock.com
