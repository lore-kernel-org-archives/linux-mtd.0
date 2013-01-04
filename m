Message-ID: <50E66E1A.80307@ti.com>
Date: Fri, 4 Jan 2013 11:22:26 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCH v2] davinci_nand: fix modular build with CONFIG_OF=y
References: <201301032127.34467.sshtylyov@ru.mvista.com>
In-Reply-To: <201301032127.34467.sshtylyov@ru.mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
 davinci-linux-open-source@linux.davincidsp.com, hs@denx.de,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

On 1/3/2013 11:57 PM, Sergei Shtylyov wrote:
> Commit cdeadd712f52b16a9285386d61ee26fd14eb4085 (mtd: nand: davinci: add OF
> support for davinci nand controller) has never been really build tested with
> the driver as a module.  When the driver is built-in, the missing semicolon
> after structure initializer is "compensated" by MODULE_DEVICE_TABLE() macro
> being empty and so the initializer using the trailing semicolon on the next
> line; when the driver is built as a module, compilation error ensues, and as
> the 'davinci_all_defconfig' has the NAND driver modular, this error prevents
> DaVinci family kernel from building...
> 
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> Cc: stable@vger.kernel.org # 3.7
> 
> ---
> The patch is atop of the recent Linus' tree.
> Sekhar, have you build tested at least 3.8-rc1?

v3.8-rc2 builds and boots fine. 'make modules' needs your patch, of
course. For this patch, FWIW:

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
