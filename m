Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcJYj-0005CR-33
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 23:57:43 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Bean Huo (beanhuo)"
 <beanhuo@micron.com>
Subject: Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Date: Sun, 8 Jul 2018 23:56:52 +0000
Message-ID: <da6f03d541e24e008f84f6f18fc8e77a@svr-chch-ex1.atlnz.lc>
References: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
 <20180706212720.0e9dacb8@bbrezillon> <20180706233701.05da0666@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,=0A=
=0A=
On 07/07/18 09:37, Boris Brezillon wrote:=0A=
> On Fri, 6 Jul 2018 21:27:20 +0200=0A=
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:=0A=
> =0A=
>> On Mon, 25 Jun 2018 10:44:42 +1200=0A=
>> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> Hi,=0A=
>>>=0A=
>>> I'm looking at adding support for the Micron MT29F1G08ABAFAWP-ITE:F chi=
p=0A=
>>=0A=
>> Hm, it's even worse than I thought. The model name does not include the=
=0A=
>> -ITE suffix (E means ECC can't be disabled), which means we have no way=
=0A=
>> to detect the version with forced on-die ECC.=0A=
>>=0A=
>> I see 2 solutions to this problem:=0A=
>> 1/ Bean provides us a solution to reliably detect when ECC can be=0A=
>>     de-actived and when it can't=0A=
>> 2/ We only ever expose 64 bytes of OOB to the user and consider that=0A=
>>     ECC can be disabled, even if it can't in reality=0A=
>>=0A=
> =0A=
> After reading the doc again, I forgot one thing you can try before=0A=
> deciding to go for option #2.=0A=
> =0A=
> 8th bit in byte 5 of READID's result encodes whether the on-die ECC=0A=
> state (enabled or not). I remember we had a discussion with Bean where=0A=
> he told us this was a runtime status reflecting the on-die ECC state,=0A=
> which is crazy, since READID might return different values depending on=
=0A=
> the NAND state, and most of the code in the core assumes READID=0A=
> provides a fixed ID that encodes the chip characteristics/capabilities,=
=0A=
> not its state.=0A=
> =0A=
> Anyway, if this bit is actually reflecting the on-die ECC state and=0A=
> on-die cannot be disabled on your chip, it should stay at 1 even after=0A=
> you have sent the SET_FEATURES(DISABLE_ECC) command. Let's hope this=0A=
> works as I expect, otherwise we're back to option #2 until Bean suggest=
=0A=
> something else.=0A=
> =0A=
=0A=
I'm away from work this week so I don't have access to that system. But =0A=
I can take a look when I get back. From memory though there was very =0A=
little that you could tell from the id/params on this chip (FYI we've =0A=
decided to use a chip from a different vendor for production).=0A=
