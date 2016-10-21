Subject: Re: [PATCH v3 1/3] mtd: s3c2410: make ecc mode configurable via
 platform data
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
References: <1476999766-32526-1-git-send-email-sergio.prado@e-labworks.com>
 <1476999766-32526-2-git-send-email-sergio.prado@e-labworks.com>
 <20161021182710.GA17279@kozik-lap>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 linux-samsung-soc@vger.kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, richard@nod.at, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, javier@osg.samsung.com, kgene@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5a626833-d4bf-a991-65ea-2849f2250dce@gmail.com>
Date: Fri, 21 Oct 2016 20:51:51 +0200
MIME-Version: 1.0
In-Reply-To: <20161021182710.GA17279@kozik-lap>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/21/2016 08:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 20, 2016 at 07:42:44PM -0200, Sergio Prado wrote:
>> Removing CONFIG_MTD_NAND_S3C2410_HWECC option and adding a ecc_mode
>> field in the drivers's platform data structure so it can be selectable
>> via platform data.
>>
>> Also setting this field to NAND_ECC_SOFT in all boards using this
>> driver since none of them had CONFIG_MTD_NAND_S3C2410_HWECC enabled.
>>
>> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>> ---
>>  arch/arm/mach-s3c24xx/common-smdk.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-anubis.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-at2440evb.c         |   1 +
>>  arch/arm/mach-s3c24xx/mach-bast.c              |   1 +
>>  arch/arm/mach-s3c24xx/mach-gta02.c             |   1 +
>>  arch/arm/mach-s3c24xx/mach-jive.c              |   1 +
>>  arch/arm/mach-s3c24xx/mach-mini2440.c          |   1 +
>>  arch/arm/mach-s3c24xx/mach-osiris.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-qt2410.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-rx1950.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-rx3715.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-vstms.c             |   1 +
>>  arch/arm/mach-s3c64xx/mach-hmt.c               |   1 +
>>  arch/arm/mach-s3c64xx/mach-mini6410.c          |   1 +
>>  arch/arm/mach-s3c64xx/mach-real6410.c          |   1 +
>>  drivers/mtd/nand/Kconfig                       |   9 --
>>  drivers/mtd/nand/s3c2410.c                     | 119 +++++++++++++------------
>>  include/linux/platform_data/mtd-nand-s3c2410.h |   6 +-
>>  18 files changed, 79 insertions(+), 70 deletions(-)
>>
> 
> I acked this twice (v1 and v2)... and still you are ignoring them. I am
> sorry, I am not gonna to ack this third time!

Hi, um, I am kinda new to this mess, what's going on ? You ACKed
previous patches, next revision was submitted, so you need to ACK
the next revision too (due to the changes).

> For v2 I acked also other patches but it it is not there as well...
> 
> BR,
> Krzysztof


-- 
Best regards,
Marek Vasut
