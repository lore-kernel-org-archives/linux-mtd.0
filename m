Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FOI-0004Eh-DH
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:45:19 +0000
Subject: Re: [PATCH linux-next v4 00/11] mtd: bcm63xxpart: Add NAND
 partitioning support
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF4E6.3030702@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:44:54 +0000
MIME-Version: 1.0
In-Reply-To: <566DF43B.5010400@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/12/15 22:42, Simon Arlott wrote:
> The BCM963xx NAND flash boards have a different handling of the
> partition layout from the NOR flash boards. For NAND there are offsets
> for the partitions in nvram. Both types of boards use the same CFE
> bootloader, nvram format and image tag in their rootfs partitions.
> 
> This patch series:
> 1-4:  Creates separate header files for bcm963xx_nvram and bcm_tag structures
> 5:    Updates the bcm_tag field image_sequence
> 6:    Removes the dependency on mach-bcm63xx from the bcm63xxpart parser
> 7:    Removes unused mach-bcm63xx nvram function
> 8-10: Cleanup and move NOR flash layout to a separate function
> 11:   Add NAND flash layout support

These patches are also available on github against next-20151211:
https://github.com/lp0/linux/commits/20151213-bcm63xxpart-v4

(Yes I am aware that the summary line and description of the patches are
not suitable for merging.)

-- 
Simon Arlott
