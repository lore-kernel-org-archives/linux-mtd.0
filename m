MIME-Version: 1.0
In-Reply-To: <1299491371.2746.14.camel@localhost>
References: <AANLkTinb7oZDzvD94RWLZqnLnaX5kY97CxJ+34eVJNmU@mail.gmail.com>
	<1299121710-6263-1-git-send-email-leiwen@marvell.com>
	<1299491371.2746.14.camel@localhost>
Date: Mon, 7 Mar 2011 18:00:08 +0800
Message-ID: <AANLkTik2px-jmz0CSq03dYWjQWp2pMpdSmkKYwNWHjt=@mail.gmail.com>
Subject: Re: [PATCH V5 1/6] pxa3xx_nand: make scan procedure more clear
From: Lei Wen <adrian.wenl@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Eric Miao <eric.y.miao@gmail.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Mon, Mar 7, 2011 at 5:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-03-03 at 11:08 +0800, Lei Wen wrote:
>> The previous probe function is some kind of big part.
>> This patch seperate the resource allocation to keep the probe process
>> more clear than before.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>
> It is a bit confusing that you sent 2 patches 1 and 6. What is in the
> middle? Is it save to apply these 2 only?
>

I just update the patch 1 and 6, since it add the comment as you mentioned.
For 2-5 has no update, I don't update them...
Those middle patch could be found at:
2/6 http://www.spinics.net/lists/arm-kernel/msg116285.html
3/6 http://www.spinics.net/lists/arm-kernel/msg116284.html
4/6 http://www.spinics.net/lists/arm-kernel/msg116282.html
5/6 http://www.spinics.net/lists/arm-kernel/msg116283.html

Best regards,
Lei
