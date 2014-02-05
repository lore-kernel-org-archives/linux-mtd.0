Message-ID: <52F201A7.2040401@ti.com>
Date: Wed, 5 Feb 2014 14:47:27 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
Subject: Re: [PATCH v5] ARM: davinci: aemif: get rid of davinci-nand driver
 dependency on aemif
References: <1391079820-13018-1-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1391079820-13018-1-git-send-email-ivan.khoronzhuk@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Thursday 30 January 2014 04:33 PM, Ivan Khoronzhuk wrote:
> The problem that the set timings code contains the call of Davinci
> platform function davinci_aemif_setup_timing() which is not
> accessible if kernel is built for another platform like Keystone.
> 
> The Keysone platform is going to use TI AEMIF driver.
> If TI AEMIF is used we don't need to set timings and bus width.
> It is done by AEMIF driver.
> 
> To get rid of davinci-nand driver dependency on aemif platform code
> we moved aemif code to davinci platform.
> 
> The platform AEMIF code (aemif.c) has to be removed once Davinci
> will be converted to DT and use ti-aemif.c driver.
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> [nsekhar@ti.com: fixed checkpatch error and a build breakage due to
> 		 missing include, rebased onto l2-mtd/master]
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>

Hope this patch looks good to you now. I would like to take it for v3.15
via DaVinci tree.

Thanks,
Sekhar
