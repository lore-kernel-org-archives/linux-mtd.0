Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RLBgZ-0001Fy-VV
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2011 10:35:17 +0000
Received: by gyf1 with SMTP id 1so219984gyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Nov 2011 03:35:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF244FEEE@Cloud.RL.local>
References: <CAAwP0s0TzB2iFzYkjAsN6q-YA9d0MEd7ViOd-UUvbMf_11q8gw@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE0BF244FEEE@Cloud.RL.local>
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Tue, 1 Nov 2011 11:34:53 +0100
Message-ID: <CAAwP0s2xeh6Bn0u-VmVsy=fo0UHo9ZGo8ps7zDWoJxU-Z75JSg@mail.gmail.com>
Subject: Re: DaVinci NAND writing utility release, was: RE: [RFC] Change ECC
	algorithm from userspace
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dlos <davinci-linux-open-source@linux.davincidsp.com>,
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

On Tue, Nov 1, 2011 at 5:18 AM, Jon Povey <Jon.Povey@racelogic.co.uk> wrote=
:
> Adding davinci linux open source ML to CC as folk there might find this
> utility useful.
>
> Javier Martinez Canillas wrote:
>> On Fri, Oct 28, 2011 at 12:33 PM, Jon Povey
>> <Jon.Povey@racelogic.co.uk> wrote:
>>> linux-mtd-bounces@lists.infradead.org wrote:
>>> DM355 and DM365 has similar issues as the RBL expects a different
>>> OOB/ECC layout to Linux.
>>>
>>> What I have done is write a utility that calculates ECC and writes to
>>> the mtd device in RAW mode. So to rewrite the bootloader I take care
>>> of the ECC and layout at application level without changing the
>>> kernel.
>
>> Is your utility publicly available? It would be great if I can use it
>> as an starting point.
>
> Management have given the thumbs-up, this is now released under GPL v2
> at https://github.com/jonpovey/flashtool
>
> Supports DM355 and DM365 RBL layouts, ECC generation, UBI image writing,
> and various bad block / range handling.
>
> Enjoy!
>
> --

Hi Jon, thanks for sharing your tool!

Today is holiday in Spain and I don't have proper hardware to test.
But tomorrow I will definitely give a try.

Thanks a lot and best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
