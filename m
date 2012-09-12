Date: Wed, 12 Sep 2012 10:51:31 +0100
From: Will Deacon <will.deacon@arm.com>
To: Christian Daudt <csd@broadcom.com>
Subject: Re: [PATCH 1/3] ARM: Remove bcmring NAND driver
Message-ID: <20120912095130.GN32234@mudshark.cambridge.arm.com>
References: <505044E3.3040601@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <505044E3.3040601@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "arm@kernel.org" <arm@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>,
 Olof Johansson <olof@lixom.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Christian,

On Wed, Sep 12, 2012 at 09:16:35AM +0100, Christian Daudt wrote:
> This driver is being removed as part of the cleanup of the bcmring
> SoC from mainline as it is no longer maintained.
> 
> Signed-off-by: Christian Daudt <csd@broadcom.com>
> Reviewed-by: Jiandong Zheng <jdzheng@broadcom.com>

This is really good to see, thanks. I guess the other two patches in your
series were too large and are being held for moderation by the list?

Anyway, for this one:

Acked-by: Will Deacon <will.deacon@arm.com>

Cheers,

Will
