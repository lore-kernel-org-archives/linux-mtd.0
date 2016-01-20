Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLrS7-0005OP-D5
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2016 12:01:35 +0000
Received: by mail-wm0-x229.google.com with SMTP id n5so25520599wmn.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2016 04:01:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF57A20@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF57A20@NTXXIAMBX02.xacn.micron.com>
Date: Wed, 20 Jan 2016 12:01:06 +0000
Message-ID: <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
Subject: Re: [RFC] spi-nor: fix cross die reads on Micron multi-die devices
From: Adam Somerville <adamsomerville@gmail.com>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "zajec5@gmail.com" <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "jteki@openedev.com" <jteki@openedev.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "furquan@google.com" <furquan@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks for looking at the this.

I can rewrite so it only affects N25Q devices, I hoped a simpler
implementation would outweigh the small overhead incurred on non
affected devices.

Do you know if there are any plans for MT25* based multi-die devices
and if they would have the same issue?

Thanks,

Adam

On Wed, Jan 20, 2016 at 2:45 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
> Hi, Adam
> This is true, but this only exist in Micron 65nm spi nor N25Q.
> For our 45nm spi nor MT25Q , MT25TL and MT25Q, does exist this question.
> So I think, can you differentiate between these in your patch?
>
>> From: Adam Somerville <adamsomerville@gmail.com>
>>
>> So as far as I can see there is a bug in the spi-nor driver when issuing=
 die
>> boundary crossing reads on Micron multi-die devices.
>> Micron N25Q512A, N25Q00AA and probably any other Micron multi-die
>> devices do not support a single read request that crosses a die boundary=
.
>>
>> The current behaviour is that the address on the device wraps back to th=
e
>> start of the first die, with any data returned beyond the boundary being=
 from
>> the start of the first die.
>>
