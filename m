From: Arnd Bergmann <arnd@arndb.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Anup Patel <anup.patel@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Sandeep Tripathy <tripathy@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 2/4] mtd: nand: Allow MTD_NAND_BRCMNAND to be selected
 for ARM64
Date: Fri, 16 Oct 2015 21:39:07 +0200
Message-ID: <5338147.WN3k6RsNEN@wuerfel>
In-Reply-To: <56214FC3.2060002@gmail.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
 <7901695.AWo8cP6Hz1@wuerfel> <56214FC3.2060002@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 October 2015 12:28:03 Florian Fainelli wrote:
> > 
> > Sorry, can't reproduce it any more. My patch is dated June 4, so it was
> > probably broken then but got fixed since. I normally try to verify that
> > the patches are still needed before I send them, but this time I only
> > saw the current discussion and remembered something vague about it
> > and sent what I had in my backlog of the randconfig-fixes series.
> 
> It may have been a problem before this patch:
> 
> d80d942bcc8e1555a76774d20be9800cfef2d415 ("ARM: BCM: Do not select
> CONFIG_MTD_NAND_BRCMNAND")
> -- 
> 

Yes, that must have been it. So my patch was not only outdated but
also wrong ;-)

	Arnd
