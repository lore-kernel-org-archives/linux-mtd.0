Received: from rv-out-0708.google.com ([209.85.198.248])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtG00-00008O-Ts
	for linux-mtd@lists.infradead.org; Mon, 13 Apr 2009 06:50:39 +0000
Received: by rv-out-0708.google.com with SMTP id l33so1715840rvb.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Apr 2009 23:50:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1239366421.3390.12.camel@localhost.localdomain>
References: <e8775dd00904012244o30200226p4e748d89d2a9b9c7@mail.gmail.com>
	<49D47252.3020701@nokia.com>
	<e8775dd00904020249k6dd1146chfae6e74c11a01f82@mail.gmail.com>
	<1239366421.3390.12.camel@localhost.localdomain>
Date: Mon, 13 Apr 2009 14:50:30 +0800
Message-ID: <e8775dd00904122350h23a9983axd507c88f283150f@mail.gmail.com>
Subject: Re: ubifs error when do bonnie++ test
From: Jason Liu <liu.h.jason@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/4/10 Artem Bityutskiy <dedekind@infradead.org>:
> On Thu, 2009-04-02 at 17:49 +0800, Jason Liu wrote:
>> 2009/4/2 Adrian Hunter <adrian.hunter@nokia.com>:
>> > Jason Liu wrote:
>> >>
>> >> I'm working on the 2.6.26 with ubifs enabled, but after some stress
>> >> test, ubifs give some err. The following is the steps to reproduce.
>> >
>> > Please apply all recent UBIFS patches and enable debugging and try
>> > again.
>> >
>> > You could also enable debugging checks, but that will really slow it d=
own.
>> >
>> >
>> After apply all the patches from users/dedekind/ubifs-v2.6.26.git
>> I still get errors with bonnie++ test and only run 3times compared 390
>> times without the patch
>>
>> Using uid:0, gid:0.
>> Writing with putc()...done
>> Writing intelligently...done
>> Rewriting...done
>> Reading with getc()...done
>> Reading intelligently...done
>> start 'em...done...done...done...
>> Create files in sequential order...done.
>> Stat files in sequential order...Expected 16384 files but only got 16385
>> Cleaning up test directory after error.
>
> So have you tried to enable UBIFS extra checks?
Yes, The test is in progress. It's really slow after enable UBIFS
debug and extra checks.It will cost half hour for one test.And the
test case failed without debug off after 600 round of test.So it will
cost 600 * 0,5 =3D 300 hours with debug on, longer than 10 days.

>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
