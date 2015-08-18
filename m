Date: Tue, 18 Aug 2015 11:10:16 -0700
From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
To: Mathieu Olivari <mathieu@codeaurora.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com"
 <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk"
 <linux@arm.linux.org.uk>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "agross@codeaurora.org" <agross@codeaurora.org>, "sboyd@codeaurora.org"
 <sboyd@codeaurora.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] mtd: add SMEM parser for QCOM platforms
Message-ID: <20150818181016.GU13472@usrtlx11787.corpusers.net>
References: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
 <1439855266-26242-4-git-send-email-mathieu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1439855266-26242-4-git-send-email-mathieu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon 17 Aug 16:47 PDT 2015, Mathieu Olivari wrote:

> On QCOM platforms using MTD devices storage (such as IPQ806x), SMEM is
> used to store partition layout. This new parser can now be used to read
> SMEM and use it to register an MTD layout according to its content.

Looks good, but the license string should be "GPL v2" (lower case v).
Just as a hint...I made checkpatch warn you about that a while back ;)

The rest is

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

[..]

> +
> +MODULE_LICENSE("GPL V2");

Regards,
Bjorn
