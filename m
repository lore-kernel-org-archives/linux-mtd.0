Message-ID: <4FFA7576.7050204@snapgear.com>
Date: Mon, 9 Jul 2012 16:08:54 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
 <1341590150.26921.16.camel@shinybook.infradead.org>
In-Reply-To: <1341590150.26921.16.camel@shinybook.infradead.org>
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

Hi David,

On 07/07/12 01:55, David Woodhouse wrote:
> On Thu, 2012-05-10 at 16:55 +1000, gerg@snapgear.com wrote:
>> But if we want to use the uclinux.c mapping driver on real MMU enabled
>> systems we should be using phys_to_virt() for the translation, since
>> that is really what we are doing. So change it to do that.
>
> That seems wrong. On a highmem page, phys_to_virt() isn't valid. So at
> the very least, any usage of phys_to_virt() needs a stonking great
> comment explaining why it's always safe because it can never be used ona
> a highmem page.

The only VM based arch this driver can be configured for currently
is m68k (actually it is even more specific, only CONFIG_COLDFIRE).
And that doesn't support HIGHMEM.

Can the kernels data region (and the area immediately after it) be in
high memory?

Regards
Greg


  
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
