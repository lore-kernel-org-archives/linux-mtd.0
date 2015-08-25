Date: Mon, 24 Aug 2015 17:25:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mathieu Olivari <mathieu@codeaurora.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux@arm.linux.org.uk, dwmw2@infradead.org,
 computersforpeace@gmail.com, agross@codeaurora.org,
 bjorn.andersson@sonymobile.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 2/3] ARM: qcom: add SMEM device node to IPQ806x dts
Message-ID: <20150825002504.GC19120@codeaurora.org>
References: <1439931860-7473-1-git-send-email-mathieu@codeaurora.org>
 <1439931860-7473-3-git-send-email-mathieu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439931860-7473-3-git-send-email-mathieu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18, Mathieu Olivari wrote:
> SMEM is used on IPQ806x to store various board related information such
> as boot device and flash partition layout. We'll declare it as a device
> so we can make use of it thanks to the new SMEM soc driver.
> 
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
