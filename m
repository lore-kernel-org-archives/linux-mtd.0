Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbUlo-0006IQ-7z
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 09:39:48 +0000
Received: by pwi3 with SMTP id 3so28599pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 02:38:57 -0700 (PDT)
Subject: Re: Preventing JFFS2 partial page writes?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Date: Tue, 28 Jun 2011 12:39:47 +0300
In-Reply-To: <1309253646.23597.58.camel@sauron>
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>
	<4E020A36.6070708@gmail.com> <1308943581.13493.15.camel@koala>
	<4E089441.3010809@gmail.com> <1309253646.23597.58.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309253992.23597.62.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Peter Barada <peter.barada@logicpd.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 12:34 +0300, Artem Bityutskiy wrote:
> OK, thanks for explanation. I am not very good in this area as I do not
> have much experience dealing with OOB, but here is what I thing.
> 
> 1. Linux MTD code was _not_ designed for "ECC'ed OOB".
> 2. I do not really know what MTD_OOB_RAW is, and the comment in mtd.h
>    is not very verbose.
> 3. But in my opinion MTD_OOB_AUTO makes most sense and should be used
>    everywhere except for some tricky cases when you want to test things
>    by writing incorrect ECC, or you have an image with ECC and you want
>    to flash it as is.
> 4. In general, OOB should be considered as belonging to the driver, and
>    modern software should not rely on OOB at all.
> 5. So MTD_OOB_AUTO make free bytes in OOB look like a contiguous buffer
>    which the _user_ can freely and _independently_ use.
> 6. In your case only this assumption does not work and your ecclayout is
>    incorrect because the OOB areas you expose are not independent.
> 7. So in your case your ecclayout should be changed and you should
>    expose only independent ECC bytes.

To put it differently, I current model does not distinguish (I think,
correct me if I am wrong) between ECC'd OOB bytes and ECC'less OOB
bytes. BTW, does your flash has the latter?

So MTD would need some work to make it distinguish between those 2 types
of OOB bytes - probably additional info could be added to the ooblayout
structure, and the interfaces could be improved. How exactly - dunno,
I'd first need to figure out what MTD_OOB_RAW is - may be Brian or Ivan
could comment.

-- 
Best Regards,
Artem Bityutskiy
