Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL9j6-0004rA-Pa
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 11:11:05 +0000
Received: by mail-oa0-f53.google.com with SMTP id j17so834033oag.26
 for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2014 03:10:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1394017388.21141.56.camel@i7.infradead.org>
References: <CACna6rzSrnx8ueOn1O5k62eTppPDRVFgTA56WgQQqWUW1asMJw@mail.gmail.com>
 <1393325817.3412.94.camel@sauron.fi.intel.com>
 <CAN8TOE8Cu0fkdV7J6ZxMAoN0oAdvBMFQETMZUa7sp0v3wocJ6w@mail.gmail.com>
 <1394009048.6302.12.camel@sauron.fi.intel.com>
 <1394017388.21141.56.camel@i7.infradead.org>
Date: Wed, 5 Mar 2014 12:10:40 +0100
Message-ID: <CACna6rzfy77-8bGS2uEX=PmgrHH5=SDSgufce-ZtyGdL2tYsEw@mail.gmail.com>
Subject: Re: Annoying ML complains about "suspicious header"
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-03-05 12:03 GMT+01:00 David Woodhouse <dwmw2@infradead.org>:
> The complexity with the threading check is that it has false positives
> with patch sets, because we *expect* those to be in a thread but without
> the normal 'Re:' in the subject. The check already does have an
> exemption if it finds [Pp][Aa][Tt][Cc][Hh] in the subject =E2=80=94 Rafa=
=C5=82,
> looking at the four messages in the moderation queue from you, if you'd
> just said [RFC PATCH] and [WIP PATCH] instead of just [RFC] and [WIP]
> alone, then they'd have sailed straight through.

Ohh, I didn't guess that. Thanks for explaining!
