Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XaoEq-0002lF-8L
 for linux-mtd@lists.infradead.org; Sun, 05 Oct 2014 16:00:48 +0000
Message-ID: <54316B19.4060507@nod.at>
Date: Sun, 05 Oct 2014 18:00:25 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Woody Wu <narkewoody@gmail.com>
Subject: Re: Block numbers of BEB
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
 <54316971.90502@nod.at>
 <b2771230-18b6-4029-9d1e-e9dc59f7b445@email.android.com>
In-Reply-To: <b2771230-18b6-4029-9d1e-e9dc59f7b445@email.android.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.10.2014 17:58, schrieb Woody Wu:
> I am afraid, some initial bad blocks actually came with the Flash manufacturer and recorded in some starting blocks of the Flash, is that right?

You mean the BBT, yes.
But what has this to do with exposing this map to userspace?

Thanks,
//richard
