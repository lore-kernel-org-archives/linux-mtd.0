Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2fLK-0008OC-VP
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 10:01:35 +0000
Message-ID: <5110D86E.5060607@freescale.com>
Date: Tue, 5 Feb 2013 18:01:18 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH v2] mtd: torturetest: add the support for random data
 pattern
References: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
 <1360052485-11961-1-git-send-email-b32955@freescale.com>
 <alpine.DEB.2.00.1302051047380.3736@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1302051047380.3736@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8805=E6=97=A5 17:48, Ricard Wanderlof =E5=
=86=99=E9=81=93:
>
> On Tue, 5 Feb 2013, Huang Shijie wrote:
>
>> Add a new module parameter 'pattern'. The meaning of the pattern is:
>> (1) pattern =3D=3D 0 for 55/AA pattern.
>> (2) pattern < 0 for random pattern.
>> (3) pattern > 0 for random pattern too, the value of the pattern is us=
ed
>> as the seed for the random generator.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>> ...
>> +static int pattern;
>> +module_param(pattern, int, S_IRUGO);
>> +MODULE_PARM_DESC(pattern, "0 for 55/AA pattern(default);"
>> + "less then 0 for random pattern;"
>> + "greater then 0 for random too, "
>> + "the value of the pattern is the seed.");
> ^^^^^^^^ parameter ?
ok, thanks.

Huang Shijie
>
> /Ricard
