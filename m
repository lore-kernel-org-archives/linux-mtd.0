Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDp0-0001nQ-C0
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 10:57:28 +0000
Subject: Re: [ v3 3/3] mtd: rawnand: stm32_fmc2: add manual mode
To: Linus Walleij <linus.walleij@linaro.org>
CC: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-4-git-send-email-christophe.kerello@st.com>
 <CACRpkdZuR-Qud1E6sm-qWx1knWx+1_J1rxT+COh76z7BxYjz-Q@mail.gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <ed956235-d439-411e-a959-edb356d9fb9f@st.com>
Date: Fri, 7 Dec 2018 11:56:36 +0100
MIME-Version: 1.0
In-Reply-To: <CACRpkdZuR-Qud1E6sm-qWx1knWx+1_J1rxT+COh76z7BxYjz-Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

Hi Linus,

It is correct.
I will replace "manual mode" by "polling mode" in next patchset.

Regards,
Christophe Kerello.

On 12/7/18 10:16 AM, Linus Walleij wrote:
> On Thu, Nov 29, 2018 at 5:42 PM Christophe Kerello
> <christophe.kerello@st.com> wrote:
> 
>> This patch adds the manual mode, a basic mode that do not need
>> any DMA channels. This mode is also useful for debug purpose.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> 
> This is a bit of drive-by comment, but "manual mode" usually
> means there is a person "a man" pulling levers and pushing
> buttons. There is nothing manual inside a computer system.
> 
> I think the more appropriate term is "polling mode" which is
> what we call code that read registers directly waiting for status
> flags rather than relying on IRQs or DMA flows.
> 
> Yours,
> Linus Walleij
> 
