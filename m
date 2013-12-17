From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH v3 0/7] mtd: spi-nor: add a new framework for SPI NOR
Date: Tue, 17 Dec 2013 05:45:38 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA56B8A@DBDE04.ent.ti.com>
References: <1387184330-14448-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56ADC@DBDE04.ent.ti.com>
 <20131217040209.GA27091@shlinux2.ap.freescale.net>
 <20980858CB6D3A4BAE95CA194937D5E73EA56B3A@DBDE04.ent.ti.com>
 <20131217045752.GA15761@shlinux2.ap.freescale.net>
In-Reply-To: <20131217045752.GA15761@shlinux2.ap.freescale.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>, "angus.clark@st.com" <angus.clark@st.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "broonie@linaro.org" <broonie@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "mike@steroidmicros.com" <mike@steroidmicros.com>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Huang Shijie [mailto:b32955@freescale.com]
>>From: Pekon Gupta [mailto:pekon@ti.com]
[...]
>> (1) Add sign-offs of main authors of m25p80, so that original contributo=
rs
>>  still remains in path of submission [1].
>Do you mean add the sign-offs in end of the patch 3's commit message?:
>	Signed-off-by: Mike Lavender <mike@steroidmicros.com>
>
I think Mike's  email ID is no-more valid. So you can either find out his
current email-Id from other sources. OR
add David's or someone else's ID which has equivalent number of
contributions in m25p80.c (that you can figure out from either commit
logs or git blame).


>>
>> (2) Also, please remove following from spi-nor.c
>>   However, you can keep this in fsl-quadspi.c.
>>   +MODULE_AUTHOR("Freescale Semiconductor Inc.");
>>   I'm sure this was _not_ present in original m25p80.c
>>  (m25p80.c was started as ST's driver as per MODULE_DESCRIPTION)
>okay.
>
Thanks much.
You can put your name instead, I don't mind that bcoz you have worked
to get this framework assembled by joining different pieces.

However, please use a email-id which is valid for long-term (preferably
your personal ID), so that even if your association with your company ends,
still there is some way to track you and keep you in loop of future patches
for this framework.

>>
>> (3)     +MODULE_LICENSE("GPL");
>> Also, I assume the license version should be "GPLv2" ?
>
>yes. it should be v2.
>

with regards, pekon
