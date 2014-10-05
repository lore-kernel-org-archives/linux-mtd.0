Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xao84-0007td-Rt
 for linux-mtd@lists.infradead.org; Sun, 05 Oct 2014 15:53:50 +0000
Message-ID: <54316971.90502@nod.at>
Date: Sun, 05 Oct 2014 17:53:21 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Woody Wu <narkewoody@gmail.com>
Subject: Re: Block numbers of BEB
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
In-Reply-To: <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
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

Am 05.10.2014 17:49, schrieb Woody Wu:
> What I said of checking /proc is wrong. What I indeed checked was /sys/class/ubi as you mentioned. The problem is, under the /sys/class/ubi, there is no information about what blocks are marked as bad, there is only information about the total number of bad blocks.

Ah, you don't want the number of bad blocks, you want a map of bad blocks.
IIRC UBI does not expose this information.

Thanks,
//richard
