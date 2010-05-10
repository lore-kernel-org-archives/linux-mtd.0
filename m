Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OBQ7J-0006Ln-Eb
	for linux-mtd@lists.infradead.org; Mon, 10 May 2010 10:21:42 +0000
Received: by pxi1 with SMTP id 1so1470216pxi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 May 2010 03:21:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273482467.2209.101.camel@localhost>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1273474175.2209.61.camel@localhost>
	<h2h6b5362aa1005100203l7530e56eh1029efd4d1428b91@mail.gmail.com>
	<1273482467.2209.101.camel@localhost>
Date: Mon, 10 May 2010 15:51:39 +0530
Message-ID: <AANLkTil153m-e1GuxAyV5fAldq-Mr4NEgGjr0KrPH8jv@mail.gmail.com>
Subject: Re: Release of UBIL: ubi with log
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 10, 2010 at 2:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Mon, 2010-05-10 at 14:33 +0530, Brijesh Singh wrote:
>> >> insmod ubi mtd=3D1,ubinize.
>> >> =A0(Second parameter "ubinize" is introduced to avoid accidental loss=
 of data.)
>> >> insmod ubifs
>> >> mount ubifs
>> >
>> > Why this ubinize parameter exists? Why you cannot detect empty media
>> > just like UBI?
>>
>> The idea was not to accidentally ubinize mtd partition.
>> For example: the file system generally don't format empty partition on
>> it's own. It is forced.
>
> File system just never formats the media, so of course they never
> corrupt anything. Utilities mkfs.ext3 and the like do this instead.
>
> In fact, you can thing of UBI the same way - it does not format, there
> is ubiformat tool for that. Then, there is one single exception - empty
> flash. It is just very handy to be able to attach it without ubiformat.
> You can consider this as an additional usefuls feature.
>
> And UBI does manage somehow to not corrupt anything. So the question was
> - why UBIL cannot?

Personally, I wasn't sure if it is nice idea to find empty flash and
then format it on it's own.

UBIL certainly can do this. I will add this, if you find it useful.
