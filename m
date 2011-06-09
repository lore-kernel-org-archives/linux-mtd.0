Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUYUF-0000S6-V0
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 06:13:00 +0000
Received: by vxd2 with SMTP id 2so1242588vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 23:12:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1307539156.31223.69.camel@localhost>
References: <20110608015625.GA27537@july> <1307530994.31223.46.camel@localhost>
	<BANLkTinOBRUiaAGrbPcxve-EzZN3YdS__g@mail.gmail.com>
	<1307539156.31223.69.camel@localhost>
Date: Thu, 9 Jun 2011 15:12:56 +0900
Message-ID: <BANLkTi=LJJTTr=SGmyfh3wDAvdg4+0SN3w@mail.gmail.com>
Subject: Re: [PATCH] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 10:19 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-06-08 at 22:21 +0900, Kyungmin Park wrote:
>> > 1. Add a comment that this is a hacky quirk to work around HW
>> > =C2=A0 identification flaw, to make it clear for the people who read t=
he
>> > =C2=A0 code.
>>
>> For the record, chip maker (memory) made different chips for each
>> vendor (Samsung Mobile, and Nokia)
>> with the design flaw, it made a workaround, not hacky quirk.
>
> OK :-) Would you please send an updated patch ?

BTW, as you mentioned, it's already checked. DeviceID is just
capacity, I mean size is already checked and 4KiB pagesize is also
checked by numbufs... So check the version ID is enough in this case?

How do you think?

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
