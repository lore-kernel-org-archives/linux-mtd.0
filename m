Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2g8J-0005Mj-Rn
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2015 14:05:48 +0000
Received: by igcph11 with SMTP id ph11so40562545igc.1
 for <linux-mtd@lists.infradead.org>; Sat, 28 Nov 2015 06:05:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151127223340.GB19615@localhost>
References: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
 <CACna6rxs==Be4Ua_AUuqZgc8ey0DYXrgUOe=7TqxBEEF7AOzKw@mail.gmail.com>
 <20151127223340.GB19615@localhost>
Date: Sat, 28 Nov 2015 15:05:26 +0100
Message-ID: <CACna6ryU3AorbbL3f7REVueREHJZMfZpvoZs0ijVj1SNG4Z6ng@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: include mtd.h header for struct mtd_info
 definition
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stable <stable@vger.kernel.org>
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

On 27 November 2015 at 23:33, Brian Norris <computersforpeace@gmail.com> wr=
ote:
> On Fri, Nov 27, 2015 at 10:25:55AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 26 November 2015 at 09:05, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
>> > Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struc=
t spi_nor")
>
> I'm not 100% sure, but I thought I recall the -stable folks picking up
> for-linus commits just based on the 'Fixes:' tags. I feel like that
> isn't always ideal, though.

I'm confused. Do you mean I shouldn't include it?
Do you have a reference to more detailed Fixes usage? All I found is
info in Documentation/SubmittingPatches:
> If your patch fixes a bug in a specific commit, e.g. you found an issue u=
sing
> git-bisect, please use the 'Fixes:' tag
I think 'Fixes' usage is OK in this case.


>> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>
>> This may be worth taking as a fix for 4.4. However I'm not aware of
>> any upstream driver failing to build because of this.
>
> I don't see why it would need rushed out. All users of spi-nor.h
> currently include mtd.h first. So there are no build failures because of
> it.

OK. It was just an OpenWrt out-of-tree driver that failed to compile.

--=20
Rafa=C5=82
