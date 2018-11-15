Subject: Re: [PATCH 1/4] dt-bindings: pwm: update bindings for MT7629 SoC
To: Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Guochun Mao <guochun.mao@mediatek.com>,
 Roy Luo <cheng-hao.luo@mediatek.com>, Weijie Gao <weijie.gao@mediatek.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <1dc7b27cbad59c413d7076ff7d16b6757014d727.1542262833.git.ryder.lee@mediatek.com>
 <1542263704.7928.2.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b96ef8a5-ea09-2d24-23a1-ca9192e29ab5@gmail.com>
Date: Thu, 15 Nov 2018 17:43:10 +0100
MIME-Version: 1.0
In-Reply-To: <1542263704.7928.2.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8
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



On 15/11/2018 07:35, Ryder Lee wrote:
> On Thu, 2018-11-15 at 14:26 +0800, Ryder Lee wrote:
>> This updates bindings for MT7629 pwm controller.
>>
>> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>> index 991728c..4a2885b 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
>> @@ -6,6 +6,7 @@ Required properties:
>>     - "mediatek,mt7622-pwm": found on mt7622 SoC.
>>     - "mediatek,mt7623-pwm": found on mt7623 SoC.
>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>> +   - "mediatek,mt7629-pwm": found on mt7629 SoC.
>>   - reg: physical base address and length of the controller's registers.
>>   - #pwm-cells: must be 2. See pwm.txt in this directory for a description of
>>     the cell format.
> 
> Please ignore this PWM patch. Sorry for the inconvenience :(
> 

Right, this would at least need a fallback compatible :)

Regards,
Matthias
