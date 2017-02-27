Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciHyX-00030u-49
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 09:52:14 +0000
Received: by mail-oi0-x241.google.com with SMTP id f192so207023oic.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 01:51:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4ae7952d-8e2f-b512-7da4-a654a7435272@gmail.com>
References: <20170221124002.585-1-zajec5@gmail.com>
 <4ae7952d-8e2f-b512-7da4-a654a7435272@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 27 Feb 2017 10:51:50 +0100
Message-ID: <CACna6ryqsTdUFogeneK2wFBLVwDXS4dCbaAf7UgyDUwbWKvMQA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] mtd: add support for partition parsers
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

On 27 February 2017 at 10:36, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 02/21/2017 01:40 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> Some devices have partitions that are kind of containers with extra
>> subpartitions / volumes instead of e.g. simple filesystem data. To
>> support such cases we need to first create normal flash partitions and
>> then take care of these special ones.
>>
>> It's very common case for home routers. Depending on the vendor there
>> are formats like TRX, Seama, uImage
>
> uImage is file format, not partition type. It's just a blob of data
> (usually kernel) with small header, I don't think we should represent
> the content of it as a partition.

You are correct, this isn't any standard container with
subpartitions/volumes. This shouldn't be listed in this commit
message, sorry. I'll drop it in V2.

--=20
Rafa=C5=82
