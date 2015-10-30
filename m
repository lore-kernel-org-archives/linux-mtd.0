Date: Fri, 30 Oct 2015 12:31:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Anup Patel <anup.patel@broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Pramod KUMAR <pramodku@broadcom.com>,
 Vikram Prakash <vikramp@broadcom.com>,
 Sandeep Tripathy <tripathy@broadcom.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 Device Tree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v5 0/3] NAND support for Broadcom NS2 SoC
Message-ID: <20151030193152.GI13239@google.com>
References: <1446188361-15146-1-git-send-email-anup.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446188361-15146-1-git-send-email-anup.patel@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 30, 2015 at 12:29:18PM +0530, Anup Patel wrote:
> We enable NAND support for Broadcom NS2 SoC by reusing existing
> BRCMNAND driver.
> 
> This patchset applies on-top of "arm64: Simple additions to
> NS2 DT" v1 patchset and is available in ns2_nand_v5 branch of
> https://github.com/Broadcom/arm64-linux.git.
> 
> The patchset is tested on NS2 SVK.

Applied patches 1 and 2. My "Reviewed-by" on patch 3 stands.

Thanks,
Brian
