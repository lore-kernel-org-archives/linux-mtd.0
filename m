Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu0jp-0008WA-RP
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 08:45:04 +0000
Received: by rv-out-0708.google.com with SMTP id l33so2686591rvb.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Apr 2009 01:44:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1239689874.3390.88.camel@localhost.localdomain>
References: <e8775dd00904012244o30200226p4e748d89d2a9b9c7@mail.gmail.com>
	<49D47252.3020701@nokia.com>
	<e8775dd00904020249k6dd1146chfae6e74c11a01f82@mail.gmail.com>
	<1239366421.3390.12.camel@localhost.localdomain>
	<e8775dd00904122350h23a9983axd507c88f283150f@mail.gmail.com>
	<1239689874.3390.88.camel@localhost.localdomain>
Date: Wed, 15 Apr 2009 16:44:55 +0800
Message-ID: <e8775dd00904150144w54bb1c31j1c50648190ede7f2@mail.gmail.com>
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

2009/4/14 Artem Bityutskiy <dedekind@infradead.org>:
> On Mon, 2009-04-13 at 14:50 +0800, Jason Liu wrote:
>> 2009/4/10 Artem Bityutskiy <dedekind@infradead.org>:
>> > On Thu, 2009-04-02 at 17:49 +0800, Jason Liu wrote:
>> >> 2009/4/2 Adrian Hunter <adrian.hunter@nokia.com>:
>> >> > Jason Liu wrote:
>> >> >>
>> >> >> I'm working on the 2.6.26 with ubifs enabled, but after some stres=
s
>> >> >> test, ubifs give some err. The following is the steps to reproduce=
.
>> >> >
>> >> > Please apply all recent UBIFS patches and enable debugging and try
>> >> > again.
>> >> >
>> >> > You could also enable debugging checks, but that will really slow i=
t down.
>> >> >
>> >> >
>> >> After apply all the patches from users/dedekind/ubifs-v2.6.26.git
>> >> I still get errors with bonnie++ test and only run 3times compared 39=
0
>> >> times without the patch
>> >>
>> >> Using uid:0, gid:0.
>> >> Writing with putc()...done
>> >> Writing intelligently...done
>> >> Rewriting...done
>> >> Reading with getc()...done
>> >> Reading intelligently...done
>> >> start 'em...done...done...done...
>> >> Create files in sequential order...done.
>> >> Stat files in sequential order...Expected 16384 files but only got 16=
385
>> >> Cleaning up test directory after error.
>> >
>> > So have you tried to enable UBIFS extra checks?
>> Yes, The test is in progress. It's really slow after enable UBIFS
>> debug and extra checks.It will cost half hour for one test.And the
>> test case failed without debug off after 600 round of test.So it will
>> cost 600 * 0,5 =3D 300 hours with debug on, longer than 10 days.
>
> When you reproduce this, please, do not forget to type dmesg
> and save the output. Also, it is good idea to save an image
> of your flash.
>
> Could you please tell what is your flash device? I see this:
> UBI: physical eraseblock size: =9A 1048576 bytes (1024 KiB)
> UBI: logical eraseblock size: =9A =9A1032192 bytes
> UBI: smallest flash I/O unit: =9A =9A8192
> UBI: VID header offset: =9A =9A =9A =9A =9A8192 (aligned 8192)
> UBI: data offset: =9A =9A =9A =9A =9A =9A =9A =9A16384
>
> So your flash have huge PEB size of 1MiB. Min I/O unit size is
> also huge - 8KiB. And no sub-pages. What is this device? Some
> kind of NAND?
>
We use 2 MLC nand flash to simulate this virtual device. Each NAND
chip is 4K page size with 218 OOB size.
We can parallel program each NAND chip in order to improve the write
performance.
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
