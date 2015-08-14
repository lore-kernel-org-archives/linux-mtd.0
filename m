Date: Fri, 14 Aug 2015 11:54:48 -0700
From: Mathieu Olivari <mathieu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux@arm.linux.org.uk, dwmw2@infradead.org,
 computersforpeace@gmail.com, agross@codeaurora.org,
 bjorn.andersson@sonymobile.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] ARM: qcom: add SMEM device node to IPQ806x dts
Message-ID: <20150814185446.GB7516@codeaurora.org>
References: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org>
 <1439501620-24073-3-git-send-email-mathieu@codeaurora.org>
 <55CD2EFE.8040606@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55CD2EFE.8040606@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 13, 2015 at 04:57:50PM -0700, Stephen Boyd wrote:
> On 08/13/2015 02:33 PM, Mathieu Olivari wrote:
> >@@ -79,6 +79,15 @@
> >  			#hwlock-cells = <1>;
> >  		};
> >+
> >+		smem {
> >+			compatible = "qcom,smem";
> >+
> >+			memory-region = <&smem>;
> >+			reg = <0x41000000 0x4000>;
> 
> Does this reg property do something? I thought we were supposed to leave
> this out when not using the rpm msg ram. Also, if there's no reg, it should
> be at the root /.
Actually; no it doesn't do much. I'll remove it.
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
