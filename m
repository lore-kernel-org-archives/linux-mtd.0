Received: from mail1317.opentransfer.com ([76.162.254.113])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0xcR-0006Xp-Jd
 for linux-mtd@lists.infradead.org; Sat, 28 Jun 2014 18:45:00 +0000
Message-ID: <53AF0D12.6040604@GlueLogix.com>
Date: Sat, 28 Jun 2014 14:44:34 -0400
From: Larry Martin <Larry@GlueLogix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Request for help booting Gumstix from MTD Flash
References: <53AEC7C9.5070408@GlueLogix.com>
In-Reply-To: <53AEC7C9.5070408@GlueLogix.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/28/2014 9:48 AM, Larry Martin wrote:
> Hello, I am writing this list because my question is not being
> answered on the Gumstix list, so I am turning to the subsystem
> developers. I have a u-boot, kernel and rootfs all booting properly
> from MMC, but when I try to boot the set from NAND the kernel says
> the rootfs superblock is empty.
>

I think I just answered my own question.  The last image I made worked 
ok.  The difference was that I changed the -c 1996 to -c 4010 in the 
mkfs.ubifs call.  My flash segment has 4011 blocks.  1996 was too few. 
I think the image was getting truncated.  I can't explain why the 
superblock was coming up empty, but the image is working now.

Thanks,
Larry
