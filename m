Date: Fri, 16 Oct 2015 09:40:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ray Jui <rjui@broadcom.com>
Cc: Anup Patel <anup.patel@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Pramod KUMAR <pramodku@broadcom.com>,
 Vikram Prakash <vikramp@broadcom.com>,
 Sandeep Tripathy <tripathy@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
 brcmnand_write()
Message-ID: <20151016164051.GE108923@google.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
 <1444986537-28387-2-git-send-email-anup.patel@broadcom.com>
 <56211976.1030401@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56211976.1030401@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 16, 2015 at 08:36:22AM -0700, Ray Jui wrote:
> Correct me if I remember it wrong, but I thought this patch has already
> been merged by Brian?

You are correct.

Anup,

Please base MTD patches on the MTD development tree (i.e., l2-mtd.git):

http://linux-mtd.infradead.org/source.html

(In this case it's no problem; I'll just ignore the first two patches.)

Brian
