Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL7Ia-0007vt-7E
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 08:35:33 +0000
Received: by mail-vc0-f178.google.com with SMTP id ik5so718002vcb.9
 for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2014 00:35:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1393325817.3412.94.camel@sauron.fi.intel.com>
References: <CACna6rzSrnx8ueOn1O5k62eTppPDRVFgTA56WgQQqWUW1asMJw@mail.gmail.com>
 <1393325817.3412.94.camel@sauron.fi.intel.com>
Date: Wed, 5 Mar 2014 00:35:10 -0800
Message-ID: <CAN8TOE8Cu0fkdV7J6ZxMAoN0oAdvBMFQETMZUa7sp0v3wocJ6w@mail.gmail.com>
Subject: Re: Annoying ML complains about "suspicious header"
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 25, 2014 at 2:56 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2014-02-25 at 07:09 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> I think it's 5th time ML complains about some unspecified "suspicious
>> header" in my patches. I sent patches using "git send-email", so I
>> really don't know what may be wrong with them.
>
> There are several rules on the server which try to trap mails which
> break threading, and HTML mails.
>
> This does work. Solving social problems with technical means newer work
> well.

s/does/doesn't/
s/newer/never/

Is that what you meant?

> Anyway, I'd vote to remove these rules altogether.

OK, but who can actually *do* this? Is dwmw the only ML moderator?

Brian
