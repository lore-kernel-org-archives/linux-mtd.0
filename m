From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH] pxa3xx_nand: fix time calculation
References: <1254907903-11797-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1255265475.16942.48.camel@localhost>
	<f17812d70910112022g63c60438jca2a0e47944813a5@mail.gmail.com>
Date: Mon, 12 Oct 2009 12:03:58 +0200
In-Reply-To: <f17812d70910112022g63c60438jca2a0e47944813a5@mail.gmail.com>
	(Eric Miao's message of "Mon, 12 Oct 2009 11:22:32 +0800")
Message-ID: <ly3a5p6i9d.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: linux-mtd@lists.infradead.org, mreimer@vpop.net, dwmw2@infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Miao <eric.y.miao@gmail.com> writes:

>>> Use DIV_ROUND_UP to calculate number of clocks. =A0Else, calculated clo=
cks
>>> are nearly always to low and for times < 10ns, they will be negative on
>>> PXA320 =A0(which has a nand clock of 104 MHz).
>>>
>>> -#define ns2cycle(ns, clk) =A0 =A0(int)(((ns) * (clk / 1000000) / 1000)=
 - 1)
>>> +#define ns2cycle(ns, clk) =A0 =A0(int)(DIV_ROUND_UP((ns) * (clk / 1000=
000), 1000) - 1)
>>
>> Why there is -1 at the end?
> ...
> I'd recommend we remove this '-1' to always make the final result
> a little bit larger and avoid the negative case. DIV_ROUND_UP() is
> kind of confusing here, since the original equation is:
>
> cycles =3D ns / (1/clk * 10^9) =3D ns * clk / 10^9

Hi Eric,

for me, the DIV_ROUND_UP() is more clean, because 'ns' are minimum
values given on the datasheet and you have to round up fractional cycle
counts hence. But I agree that

| #define ns2cycle(ns, clk) (int)(DIV_ROUND_UP((ns) * (clk / 1000000), 1000=
) - 1)

and

| #define ns2cycle(ns, clk) (int)(((ns) * (clk / 1000000) / 1000))

give same results for most values.  I do not have a strong preference
for one of these two variants.


> Could you please verify that removing '-1' will solve all corner
> cases?

Except for overflows (which are uninteresting here), timings which are
a multiple of 1000ns are the only corner cases.  And these will result
into cycle counts which are increased by 1 compared to their ideal
value.



Enrico
