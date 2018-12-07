Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCFx-0005Q3-9G
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:17:10 +0000
Received: by mail-lj1-x244.google.com with SMTP id l15-v6so2907958lja.9
 for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2018 01:16:57 -0800 (PST)
MIME-Version: 1.0
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-4-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1543509663-26128-4-git-send-email-christophe.kerello@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Dec 2018 10:16:44 +0100
Message-ID: <CACRpkdZuR-Qud1E6sm-qWx1knWx+1_J1rxT+COh76z7BxYjz-Q@mail.gmail.com>
Subject: Re: [ v3 3/3] mtd: rawnand: stm32_fmc2: add manual mode
To: christophe.kerello@st.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 29, 2018 at 5:42 PM Christophe Kerello
<christophe.kerello@st.com> wrote:

> This patch adds the manual mode, a basic mode that do not need
> any DMA channels. This mode is also useful for debug purpose.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

This is a bit of drive-by comment, but "manual mode" usually
means there is a person "a man" pulling levers and pushing
buttons. There is nothing manual inside a computer system.

I think the more appropriate term is "polling mode" which is
what we call code that read registers directly waiting for status
flags rather than relying on IRQs or DMA flows.

Yours,
Linus Walleij
