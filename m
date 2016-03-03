Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abWpS-0005yS-96
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 17:14:23 +0000
Date: Thu, 3 Mar 2016 17:13:47 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
Message-ID: <20160303171347.GY19428@n2100.arm.linux.org.uk>
References: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
 <CAKv+Gu_8Fggh+hnVnj6pM6PbOysWFTNt=ot6nudLur9nzs2FVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_8Fggh+hnVnj6pM6PbOysWFTNt=ot6nudLur9nzs2FVg@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 03, 2016 at 05:24:41PM +0100, Ard Biesheuvel wrote:
> If there are no remaining objections, may I suggest that Dan takes
> patch #1 and #2, and that I put the third patch into Russell's patch
> system? The only strict ordering requirement is that #1 is merged
> before #2 and #3 both hit mainline, and that is solved by taking #1
> and #2 in order.

How does the dependency between 1 and 3 get satisfied?  Your comment
makes no sense to me.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
