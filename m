Received: from caramon.arm.linux.org.uk ([78.32.30.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBjix-0007ec-D7
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 09:59:12 +0000
Date: Wed, 12 Sep 2012 10:57:41 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 1/3] ARM: Remove bcmring NAND driver
Message-ID: <20120912095741.GY13739@n2100.arm.linux.org.uk>
References: <505044E3.3040601@broadcom.com>
 <20120912095130.GN32234@mudshark.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120912095130.GN32234@mudshark.cambridge.arm.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Christian Daudt <csd@broadcom.com>,
 "arm@kernel.org" <arm@kernel.org>,
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

On Wed, Sep 12, 2012 at 10:51:31AM +0100, Will Deacon wrote:
> Hi Christian,
> 
> On Wed, Sep 12, 2012 at 09:16:35AM +0100, Christian Daudt wrote:
> > This driver is being removed as part of the cleanup of the bcmring
> > SoC from mainline as it is no longer maintained.
> > 
> > Signed-off-by: Christian Daudt <csd@broadcom.com>
> > Reviewed-by: Jiandong Zheng <jdzheng@broadcom.com>
> 
> This is really good to see, thanks. I guess the other two patches in your
> series were too large and are being held for moderation by the list?

They have typos in the list address.
