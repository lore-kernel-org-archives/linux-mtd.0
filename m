Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq4Z1-0008Rg-H4
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 13:38:19 +0000
Received: by vws11 with SMTP id 11so5571509vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 06:38:00 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1283173086.12995.74.camel@brekeke>
References: <1283028125-6027-1-git-send-email-vapier@gentoo.org>
	<1283173086.12995.74.camel@brekeke>
From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 30 Aug 2010 09:31:48 -0400
Message-ID: <AANLkTi=e+_AhXjHp9EsZqNe2ZZYwW-uYu-wNQ5PkHf-i@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH] mtd: Blackfin NFC: fix invalid free
	in remove()
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 30, 2010 at 08:58, Artem Bityutskiy wrote:
> On Sat, 2010-08-28 at 16:42 -0400, Mike Frysinger wrote:
>> Since info->mtd isn't dynamically allocated, we shouldn't attempt to
>> kfree() it. =C2=A0Otherwise we get random fun corruption when unloading
>> the driver built as a module.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> note: this should be merged for 2.6.36 and probably sent to stable trees
>
> You send the same patch 2 times once with this note and the other time
> without this note. Which one should be ignored?

they're the same thing.  i used a wrong option with git-send-email.
-mike
