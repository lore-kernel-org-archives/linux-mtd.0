Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJl7E-0005Gl-En
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 12:00:53 +0000
Received: by ggnk3 with SMTP id k3so4061096ggn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 05:00:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4EAA973F.8060104@parrot.com>
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
	<4EAA845B.1020009@parrot.com>
	<CAAwP0s32AJCm_AjxubDSu8ikzhXeRWUqqsPrBmygUHPkRvtv8g@mail.gmail.com>
	<4EAA973F.8060104@parrot.com>
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 28 Oct 2011 14:00:30 +0200
Message-ID: <CAAwP0s0EG1cNZbDYwPe6ezD+r+1nQVJ4gd8+hCFjtyEAPVJLvA@mail.gmail.com>
Subject: Re: [RFC] Change ECC algorithm from userspace
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 28, 2011 at 1:51 PM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Javier Martinez Canillas a =C3=A9crit :
>> On Fri, Oct 28, 2011 at 12:30 PM, Matthieu CASTET
>> <matthieu.castet@parrot.com> wrote:
>>> PS : note that some OMAP ROM support a better protection than Hamming (=
but the
>>> details are not public AFAIK)
>>>
>>> From OMAP34xx Multimedia Device, Silicon Revision 3.1.x, public version=
 :
>>>
>>> Pages can contain errors caused by memory alteration. To correct these =
errors,
>>> the ROM code uses ECC,
>>> based on Hamming codes for SLC NAND and BCH (Bose, Ray-Chaudhuri, Hocqu=
enghem)
>>> code for
>>> multilevel cell (MLC) devices. The computed ECC is compared to ECC stor=
ed in the
>>> spare area of the
>>> corresponding page. If there are uncorrectable errors, the ROM code ret=
urns with
>>> FAIL.
>>>
>>
>> Yes I've read that on the DM3730 TRM but as far as I understand only
>> applies to MLC devices, but ours is SLC.
>>
> It also works on SLC devices. We are using it on micron slc that need 4 b=
its ECC.
>

That is a great thing to know, I didn't get that from the
documentation (DM3730 TRM).

And this ECC scheme that is supported for SLC devices it is also BCH?
Or the ROM boot uses a different algorithm to calculate the codes to
be stored on the oob?

Thank and best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
