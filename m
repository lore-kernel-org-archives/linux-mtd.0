Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHbPZ-0002Ju-IP
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 12:42:38 +0000
Received: by bwz1 with SMTP id 1so1202424bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 05:42:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304010579.2737.1.camel@localhost>
References: <BANLkTimt+yL47W-eJ5YuwCGsEhyzX5R7jg@mail.gmail.com>
	<1304010579.2737.1.camel@localhost>
Date: Wed, 4 May 2011 18:12:35 +0530
Message-ID: <BANLkTikHouh0Wgn8tEa-N9UXn=ZpExy-QA@mail.gmail.com>
Subject: Re: hardware ecc support in ubifs
From: Amit Pundir <pundiramit@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 28, 2011 at 10:39 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Wed, 2011-04-27 at 15:20 +0530, Amit Pundir wrote:
>> Hi,
>>
>> Does UBIFS support 1-bit h/w ECC?
>
> The MTD laye is taking care of ECC. And just in case, neither UBI nor
> UBIFS use OOB.

Thanks for sharing the information.

Regards,
Amit Pundir

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
