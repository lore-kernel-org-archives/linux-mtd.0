Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4DDg-0008Um-3N
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 19:37:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id A482E28C0E9
 for <linux-mtd@lists.infradead.org>; Wed,  2 Dec 2015 20:37:07 +0100 (CET)
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
 [209.85.215.44])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 3046228BEE1
 for <linux-mtd@lists.infradead.org>; Wed,  2 Dec 2015 20:36:48 +0100 (CET)
Received: by lfs39 with SMTP id 39so60927996lfs.3
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 11:36:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151202190555.GJ64635@google.com>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Wed, 2 Dec 2015 20:36:33 +0100
Message-ID: <CAOiHx=mUSmDB_KQNpyksc93D+RKBbR8cwas_DsTPL8H34dxz6g@mail.gmail.com>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
To: Brian Norris <computersforpeace@gmail.com>
Cc: Simon Arlott <simon@fire.lp0.eu>, Florian Fainelli <f.fainelli@gmail.com>,
 Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 2, 2015 at 8:05 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> + Broadcom list + Kamal
>
> On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
>> Add device tree binding for NAND on the BCM63268.
>>
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers.
>>
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> index 4ff7128..f2a71c8 100644
>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> @@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
>>         and enable registers
>>       - reg-names: (required) "nand-int-base"
>>
>> +   * "brcm,nand-bcm63268"
>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>
> Looks like you're aiming to support bcm63168? Is bcm63268 the first
> chip to include this style of register then? The numbering seems
> backwards, but that may just be reality.

There are four chip variants, bcm63168, bcm63268, bcm63169 and
bcm63269, and they were all introduced at the same time. the *16x have
less features than *26x (IIRC only two rgmii ports instead of four, no
hw crypto, maybe no dect?), and the *9 ones have no xDSL support.

>From a registers location/layout, clocks, etc standpoint, there is no
difference between bcm63168 and bcm63268 (and the x9's).

As a reference, Broadcom uses bcm63268 as the "generic" name for the
chip family in their code, but on their website only advertise the
bcm63168. Both chips do exist though, and at least the bcm63169, I
have devices with these three here.


Jonas
