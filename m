Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8SmE-00023z-Mu
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2018 15:44:16 +0000
Received: by mail-wr0-x244.google.com with SMTP id q13so33419184wre.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2018 08:44:04 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-2-git-send-email-albeu@free.fr>
 <344e0087-7410-aebb-8a66-c6976064df10@linaro.org>
 <20180417165420.423a691b@avionic-0020>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8c4b48ad-e99e-030a-a4ee-b6df0fa59c79@linaro.org>
Date: Tue, 17 Apr 2018 16:44:01 +0100
MIME-Version: 1.0
In-Reply-To: <20180417165420.423a691b@avionic-0020>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for explaining,

On 17/04/18 15:54, Alban wrote:
> This will not only allow reading the calibration data from nvmem, but
> will also create a partition on the MTD device, which is not acceptable.
> With my proposed binding this would become:
> 
> flash@0 {
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 	compatible = "s25sl064a";
> 	reg = <0>;
> 
> 	nvmem-cells {
> 		compatible = "nvmem-cells";
> 		#address-cells = <1>;
> 		#address-cells = <1>;
> 
> 		calibration: calib@404 {
> 			reg = <0x404 0x10>;
> 		};
> 	};

Why can't we make nvmem-cells node a nvmem provider in this case?
Which should work!

--srini


> };
> 
> Which would work fine as the MTD code will ignore the nvmem-cells
> subnode thanks to its compatible string.
