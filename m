Subject: Re: [PATCH v2 4/4] arm64: dts: Add BRCM IPROC NAND DT node for NS2
To: Anup Patel <anup.patel@broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
 <1444986537-28387-5-git-send-email-anup.patel@broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR
 <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>,
 Sandeep Tripathy <tripathy@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <562603F7.7000202@arm.com>
Date: Tue, 20 Oct 2015 10:05:59 +0100
MIME-Version: 1.0
In-Reply-To: <1444986537-28387-5-git-send-email-anup.patel@broadcom.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 16/10/15 10:08, Anup Patel wrote:
> The NAND controller on NS2 SoC is compatible with existing
> BRCM IPROC NAND driver so let's enable it in NS2 DT and
> NS2 SVK DT.
>
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>   arch/arm64/boot/dts/broadcom/ns2-svk.dts | 12 ++++++++++++
>   arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++++++
>   2 files changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> index e5950d5..a754160 100644
> --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> @@ -63,5 +63,17 @@
>   		uart3: serial@66130000 {
>   			status = "ok";
>   		};

Better to change even the above reference, see below.

> +
> +		nand: nand@66460000 {

In most of the cases where such static overlays are done, I have seen
the labels being used to refer back the node. Using the complete node
name again is kind of inviting trouble as even minor typo results in
creation of another node.

-- 
Regards,
Sudeep
