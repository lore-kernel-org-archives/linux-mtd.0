Date: Fri, 14 Aug 2015 10:25:37 -0700
From: Mathieu Olivari <mathieu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux@arm.linux.org.uk, dwmw2@infradead.org,
 computersforpeace@gmail.com, agross@codeaurora.org,
 bjorn.andersson@sonymobile.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: qcom: add SFPB nodes to IPQ806x dts
Message-ID: <20150814172536.GA7516@codeaurora.org>
References: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org>
 <1439501620-24073-2-git-send-email-mathieu@codeaurora.org>
 <55CD25B6.6050901@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55CD25B6.6050901@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 13, 2015 at 04:18:14PM -0700, Stephen Boyd wrote:
> On 08/13/2015 02:33 PM, Mathieu Olivari wrote:
> >Add one new node to the ipq806x.dtsi file to declare & register the
> >hardware spinlock devices. This mechanism is required to be used by
> >other drivers such as SMEM.
> >
> >Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> >---
> >  arch/arm/boot/dts/qcom-ipq8064.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> >index 9f727d8..ea7b959 100644
> >--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> >+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> >@@ -67,6 +67,18 @@
> >  			clock-frequency = <32768>;
> >  			#clock-cells = <0>;
> >  		};
> >+
> >+		sfpb_mutex_block: syscon@01200600 {
> 
> I think you can drop the leading 0 here. Also this should be moved into the
> soc node.
> 
> >+			compatible = "syscon";
> >+			reg = <0x01200600 0x100>;
> >+		};
> >+
> >+		sfpb_mutex: sfpb-mutex {
> >+			compatible = "qcom,sfpb-mutex";
> >+			syscon = <&sfpb_mutex_block 4 4>;
> >+
> >+			#hwlock-cells = <1>;
> >+		};
> 
> And this node should be moved to the root /.
> >  	};
> >  	soc: soc {
Right; I'll repost a patch to address both of these.
> 
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
