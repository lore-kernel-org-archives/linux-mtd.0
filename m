Message-ID: <53628627.2020401@gmail.com>
Date: Thu, 01 May 2014 19:36:39 +0200
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/9] mtd: nand: define struct nand_timings
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-2-git-send-email-b.brezillon.dev@gmail.com>
 <20140430175157.GB2497@norris-Latitude-E6410>
In-Reply-To: <20140430175157.GB2497@norris-Latitude-E6410>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 30/04/2014 19:51, Brian Norris wrote:
> Hi Boris,
>
> On Wed, Mar 12, 2014 at 07:07:36PM +0100, Boris BREZILLON wrote:
>> +
>> +/**
>> + * struct nand_sdr_timings - SDR NAND chip timings
>> + *
>> + * This struct defines the timing requirements of a SDR NAND chip.
>> + * These informations can be found in every NAND datasheets and the timings
>> + * meaning are described in the ONFI specifications:
>> + * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf‎ (chapter 4.15 Timing
> Can you remove the unicode U+200E character?

Sure

>
>> + * Parameters)
> Please document the units for these fields here. It looks like you're
> using picoseconds.

I'll add field units (which are indeed picoseconds) to this comment.

Best Regards,

Boris
