Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8DF1-0007K8-JC
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 20:27:36 +0000
Subject: Re: [PATCH linux-next (v3) 3/3] mtd: part: Add BCM962368 CFE
 partitioning support
To: Jonas Gorski <jogo@openwrt.org>
References: <566B460F.1040603@simon.arlott.org.uk>
 <566B47D9.8020105@simon.arlott.org.uk>
 <CAOiHx==GSwCxWmaQfmHHumGu_ye6waf-DA_5+m8_Ukc1hVeBYg@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MIPS Mailing List <linux-mips@linux-mips.org>, linux-api@vger.kernel.org
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DD491.4030902@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 20:26:57 +0000
MIME-Version: 1.0
In-Reply-To: <CAOiHx==GSwCxWmaQfmHHumGu_ye6waf-DA_5+m8_Ukc1hVeBYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/15 23:12, Jonas Gorski wrote:
> On Fri, Dec 11, 2015 at 11:02 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>> +#define BCM63XX_CFE_MAGIC_OFFSET       0x4e0
>> +#define BCM963XX_CFE_VERSION_OFFSET    0x570
>> +#define BCM963XX_NVRAM_OFFSET          0x580
> 
> You should decide whether you want to call it BCM63XX (the SoC) or
> BCM963XX (the Board using the SoC). Also probably better served in
> bcm963xx_nvram.h

I'm going to name the CFE locations, nvram and anything that is a
property of the flash layout BCM963XX_*, as a theoretical board using
BCM63XX with no flash wouldn't use these. The parser is still called
bcm63xxpart so that's currently an anomaly.

I'm working on making it support both NOR and NAND flash layouts.

-- 
Simon Arlott
