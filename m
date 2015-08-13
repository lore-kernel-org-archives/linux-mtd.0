Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPyp6-0002I7-4v
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 20:10:00 +0000
Message-ID: <55CCF980.7080703@hauke-m.de>
Date: Thu, 13 Aug 2015 22:09:36 +0200
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: computersforpeace@gmail.com
CC: linux-mtd@lists.infradead.org, rjui@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 zajec5@gmail.com, devicetree@vger.kernel.org, jogo@openwrt.org,
 mathieu@codeaurora.org
Subject: Re: [PATCH v2] mtd: part: add generic parsing of linux,part-probe
References: <1432492714-12598-1-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1432492714-12598-1-git-send-email-hauke@hauke-m.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/24/2015 08:38 PM, Hauke Mehrtens wrote:
> This moves the linux,part-probe device tree parsing code from
> physmap_of.c to mtdpart.c. Now all drivers can use this feature by just
> providing a reference to their device tree node in struct
> mtd_part_parser_data.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
> 
> changes since
> v1:
>  * add documentation for linux,part-probe
>  * fix spacing
>  * add documentation for of_get_probes()
> 
>  Documentation/devicetree/bindings/mtd/nand.txt | 16 ++++++++++
>  drivers/mtd/maps/physmap_of.c                  | 40 +-----------------------
>  drivers/mtd/mtdpart.c                          | 43 ++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+), 39 deletions(-)
> 
I just want to bring this up again.

@Brian do you still have any problem with this patch? Should I use a
different approach and if so which? I think we agreed on that it is bad
when the flash chip driver decides which parser to use and it is not
possible to change it other that changing the code, but this is the
current situation with most drivers.

Hauke
