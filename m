Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyiob-00017F-9R
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 16:09:05 +0000
Subject: Re: [PATCH v7,1/3] dt-bindings: binding for jz4780-{nand,bch}
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-2-git-send-email-harvey.hunt@imgtec.com>
 <20151104085751.55fbf3c3@bbrezillon>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, "Zubair
 Lutfullah Kakakhel" <Zubair.Kakakhel@imgtec.com>,
 <linux-kernel@vger.kernel.org>, Alex Smith <alex.smith@imgtec.com>, "Alex
 Smith" <alex@alex-smith.me.uk>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <564B5100.1080400@imgtec.com>
Date: Tue, 17 Nov 2015 16:08:32 +0000
MIME-Version: 1.0
In-Reply-To: <20151104085751.55fbf3c3@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 04/11/15 07:57, Boris Brezillon wrote:
> Hi Harvey,
>
> On Tue, 6 Oct 2015 17:27:15 +0100
> Harvey Hunt <harvey.hunt@imgtec.com> wrote:
>
>> From: Alex Smith <alex.smith@imgtec.com>
>>
>> Add DT bindings for NAND devices connected to the NEMC on JZ4780 SoCs,
>> as well as the hardware BCH controller, used by the jz4780_{nand,bch}
>> drivers.
>
> Patch 3 does not seem to follow this binding: it still uses the
> ingenic,ecc-xxx properties and defines NAND timings.

I'll fix this for v8.

> Also, as answered to patch 3, I think it would be clearer to separate
> the nand controller and nand chip representation.

I agree - I'll implement this in the next version.

> Best Regards,
>
> Boris

Thanks,

Harvey Hunt
