Received: from mail-qy0-f199.google.com ([209.85.221.199])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC97u-0004Y4-G2
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 10:25:19 +0000
Received: by qyk37 with SMTP id 37so9377662qyk.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 May 2010 03:25:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273658481.22706.73.camel@localhost>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
	<AANLkTilSqtxewM9WNSu814FT9qsctuuxNiK4pboX2xjr@mail.gmail.com>
	<1273653341.22706.46.camel@localhost>
	<AANLkTikRDNia3IMCbXFs-olREPftszw-zqn3ruXCk-QE@mail.gmail.com>
	<1273658481.22706.73.camel@localhost>
Date: Wed, 12 May 2010 15:55:17 +0530
Message-ID: <AANLkTin13L14cnsliFaK1H8xsT3X6II6EWEI6VCissSY@mail.gmail.com>
Subject: Re: UBIL design doc
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	rohitvdongre@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 12, 2010 at 3:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2010-05-12 at 15:19 +0530, Brijesh Singh wrote:
>> >> Any thing goes bad, normal scanning becomes recovery.
>> >> 5) Not sure if log is required in first place. But it could be an opt=
ion.
>> >> Is that correct?
>> >
>> > No, at least I did not suggest you to get rid of the log. It is needed
>> > to handle unclean reboots.
>> Log is written for each EC or VID change.
>
> Yes, I understand.
>
>> =A0Frequency of log write is same as
>> the frequency of these headers.
>
> Right.
>
>> =A0In case we keep both, there will be one log
>> write penalty per write/erase.
>
> Yes, each time you write to an unmapped LEB, you write the VID header
> and a log entry.
>
>> =A0So write performance will drop considerably.
>
> Not sure about 'considerably'. This is to be tested. Keeping the headers
> means 1 additional write per peb_size bytes, right? Plus just after
> erase, EC header should be written. But this is the price you pay for
> robustness and compatibility.
>
> But again, it is very easy to switch off headers if this is needed,
> isn't it?
Yes.
