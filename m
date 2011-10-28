Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJkO8-0004i5-MH
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 11:14:17 +0000
Received: by ggnk3 with SMTP id k3so4028417ggn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 04:14:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF244FAD1@Cloud.RL.local>
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE0BF244FAD1@Cloud.RL.local>
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 28 Oct 2011 13:13:54 +0200
Message-ID: <CAAwP0s0TzB2iFzYkjAsN6q-YA9d0MEd7ViOd-UUvbMf_11q8gw@mail.gmail.com>
Subject: Re: [RFC] Change ECC algorithm from userspace
To: Jon Povey <Jon.Povey@racelogic.co.uk>
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

On Fri, Oct 28, 2011 at 12:33 PM, Jon Povey <Jon.Povey@racelogic.co.uk> wro=
te:
> linux-mtd-bounces@lists.infradead.org wrote:
>> I want to be able to use 1-bit ECC for the first partition where I
>> save the loader binary and has to be accessed by the ROM boot but use
>> a 4-bit ECC for my rootfs partition.
>>
>> Does anyone have this same issue?
>
> DM355 and DM365 has similar issues as the RBL expects a different OOB/ECC
> layout to Linux.
>
>> What is the best approach to store data in a NAND device using
>> different ECC techniques?
>
> What I have done is write a utility that calculates ECC and writes to
> the mtd device in RAW mode. So to rewrite the bootloader I take care of
> the ECC and layout at application level without changing the kernel.
>

Hi Jon,

Thanks for your help. I see that both you and Matthieu use the same
approach so I guess that is the common workaround for this problem. I
will do the same.

Is your utility publicly available? It would be great if I can use it
as an starting point.

Thank you and best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
