MIME-Version: 1.0
In-Reply-To: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
References: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
From: Jonas Gorski <jogo@openwrt.org>
Date: Tue, 18 Aug 2015 14:30:14 +0200
Message-ID: <CAOiHx=nPDBPsj_Kg_7AkFeieedwGbcJmvALDp2eK+6aKi0wOJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] qcom: Add SMEM MTD parser
To: Mathieu Olivari <mathieu@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, agross@codeaurora.org,
 sboyd@codeaurora.org, bjorn.andersson@sonymobile.com,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Aug 18, 2015 at 1:47 AM, Mathieu Olivari <mathieu@codeaurora.org> wrote:
> QCOM platforms such as IPQ806x are using SMEM to store their flash
> layout. This patch set adds the DT nodes required to instanciate SMEM
> on IPQ806x and add an MTD parser using it.
>
> This change is based on the SMEM driver posted here:
> *https://lkml.org/lkml/2015/7/27/1125

Nice work. After testing it on AP148 I see this:

[    2.481507] 12 qcom-smem partitions found on MTD device qcom-nandc
[    2.481540] Creating 12 MTD partitions on "qcom-nandc":
[    2.486690] 0x000000000000-0x000000040000 : "0:SBL1"
[    2.492842] 0x000000040000-0x000000180000 : "0:MIBIB"
[    2.497857] 0x000000180000-0x0000002c0000 : "0:SBL2"
[    2.502895] 0x0000002c0000-0x000000540000 : "0:SBL3"
[    2.507828] 0x000000540000-0x000000660000 : "0:DDRCONFIG"
[    2.512857] 0x000000660000-0x000000780000 : "0:SSD"
[    2.518074] 0x000000780000-0x000000a00000 : "0:TZ"
[    2.522834] 0x000000a00000-0x000000c80000 : "0:RPM"
[    2.527607] 0x000000c80000-0x000001180000 : "0:APPSBL"
[    2.532472] 0x000001180000-0x000001200000 : "0:APPSBLENV"
[    2.537586] 0x000001200000-0x000001340000 : "0:ART"
[    2.543140] 0x000001340000-0x000005340000 : "rootfs"

Are all these partition names supposed to be prefixed with "0:"? This
is using the OpenWrt applied version.


Jonas
