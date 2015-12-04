Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4xw6-0001LD-CT
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 21:30:40 +0000
Message-ID: <b3a23d0b4e1e11c9b71848e0345777cd4163f185@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
In-Reply-To: <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ@mail.gmail.com>
References: <565F81A6.6060307@simon.arlott.org.uk>
 <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ@mail.gmail.com>
Date: Fri, 4 Dec 2015 21:29:55 -0000
Subject: Re: [PATCH 1/3] mtd: brcmnand: Add brcm,bcm6368-nand device tree
 binding
From: "Simon Arlott" <simon@fire.lp0.eu>
To: "Jonas Gorski" <jogo@openwrt.org>,
 "Brian Norris" <computersforpeace@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "MTD Maling List" <linux-mtd@lists.infradead.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Pawel Moll" <pawel.moll@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Ian Campbell" <ijc+devicetree@hellion.org.uk>,
 "Kumar Gala" <galak@codeaurora.org>,
 "bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 "Kamal Dasu" <kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, December 4, 2015 16:04, Jonas Gorski wrote:
> On Thu, Dec 3, 2015 at 12:41 AM, Simon Arlott <simon@fire.lp0.eu> wrote:
>> +   * "brcm,nand-bcm6368"
>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
>> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
>> +       and enable registers, and boot address registers
>> +     - reg-names: (required) "nand-intr-base"
>
> Can't we use the same name as bcm63138, i.e. nand-int-base?

Brian,

Before I change this, is there anything else in the patch series that needs to
be changed?

(I'll keep the comment referring to "NAND_INTR_BASE" the same because that's the name
in the original #define for this hardware.)

-- 
Simon Arlott
