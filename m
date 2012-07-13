Message-ID: <4FFFBF4C.9070407@snapgear.com>
Date: Fri, 13 Jul 2012 16:25:16 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
 <1341590150.26921.16.camel@shinybook.infradead.org>
 <4FFA7576.7050204@snapgear.com>
 <1342079353.30654.18.camel@shinybook.infradead.org>
In-Reply-To: <1342079353.30654.18.camel@shinybook.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/07/12 17:49, David Woodhouse wrote:
> On Mon, 2012-07-09 at 16:08 +1000, Greg Ungerer wrote:
>>
>> The only VM based arch this driver can be configured for currently
>> is m68k (actually it is even more specific, only CONFIG_COLDFIRE).
>> And that doesn't support HIGHMEM.
>
> OK, can we at least have a comment to that effect in the code, alongside
> that phys_to_virt() call so that nobody is tempted to copy it into new
> code? And preferably also an '#ifdef CONFIG_HIGHMEM / #error' in the
> code or a (redundant) !HIGHMEM dependency in Kconfig just to make sure,
> in case it's ever enabled on other architectures or in case HIGHMEM ever
> comes to m68k.

I'll come up with something and send a patch.


>> Can the kernels data region (and the area immediately after it) be in
>> high memory?
>
> No, that'll be in the directly mapped region.

Then does it matter whether HIGHMEM is enabled or not?
The phys address here is _ebss, the end of the kernels bss section.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
