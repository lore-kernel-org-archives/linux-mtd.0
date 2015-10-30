From: Anup Patel <anup.patel@broadcom.com>
To: Anup Patel <anup.patel@broadcom.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Linux MTD
 <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, "Ian
 Campbell" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Florian
 Fainelli" <f.fainelli@gmail.com>, Pramod Kumar <pramodku@broadcom.com>,
 Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy
 <tripathy@broadcom.com>, Linux ARM Kernel
 <linux-arm-kernel@lists.infradead.org>, Device Tree
 <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH v4 0/3] NAND support for Broadcom NS2 SoC
Date: Fri, 30 Oct 2015 06:57:32 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7B02194@SJEXCHMB10.corp.ad.broadcom.com>
References: <1446185938-17520-1-git-send-email-anup.patel@broadcom.com>
In-Reply-To: <1446185938-17520-1-git-send-email-anup.patel@broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Please disregard this patchset.

There is an accidental typo in patch2.

We should use ~CFG_BUS_WIDTH instead of CFG_BUS_WIDTH
in patch2. I will quickly send v5 patchset to fix this.

Sorry, for the noise.

Regards,
Anup
