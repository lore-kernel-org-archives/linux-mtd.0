Message-ID: <505032F2.4090102@freescale.com>
Date: Wed, 12 Sep 2012 15:00:02 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH 6/9] mtd: gpmi: simplify the setting DLL code
References: <1347344231-10295-1-git-send-email-b32955@freescale.com>
 <1347344231-10295-7-git-send-email-b32955@freescale.com>
 <504F7E10.8030406@gmail.com>
In-Reply-To: <504F7E10.8030406@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: dirk.behme@de.bosch.com, dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 ffainelli@freebox.fr, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B409=E6=9C=8812=E6=97=A5 02:08, Vikram Narayanan =E5=
=86=99=E9=81=93:
>>
>> /*
>> * After we enable the GPMI DLL, we have to wait 64 clock cycles before
>> - * we can use the GPMI.
>> - *
>> - * Calculate the amount of time we need to wait, in microseconds.
>> + * we can use the GPMI. Calculate the amount of time we need to wait,
>> + * in microseconds.
>> */
>> clock_period_in_ns =3D 1000000000 / clk_get_rate(r->clock[0]);
>
> NSEC_PER_SEC macro in the above statement?
>
> Don't curse me for commenting about the code that you've not written.=20
> As this patch does some cleanups, I'm suggesting this.=20
I finally get what's your meaning. thanks for you review :)

I really appreciate it.


Best Regards
Huang Shijie
