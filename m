Received: from mail-wy0-f172.google.com ([74.125.82.172])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6BnW-0000PN-B7
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 01:40:27 +0000
Received: by wyg24 with SMTP id 24so1705911wyg.17
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 18:40:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1316503194.4849.39.camel@sauron>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-4-git-send-email-computersforpeace@gmail.com>
	<1315749440.18731.65.camel@sauron>
	<1316405649.24366.17.camel@sauron>
	<CAN8TOE_RsH28su8ET2MA9MWydniP9J223w=qqPSxV3R78=q2fg@mail.gmail.com>
	<1316503194.4849.39.camel@sauron>
Date: Tue, 20 Sep 2011 18:40:24 -0700
Message-ID: <CAN8TOE9AZTqSBpWevibnPFXh_pBKw3MR_OgCR+SaUcySmoyKAw@mail.gmail.com>
Subject: Re: [PATCH 03/14] mtd: define `is_ecc_error()' macros
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org, Matthew Creech <mlcreech@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 20, 2011 at 12:19 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> I'll either repost with a better naming scheme or update my patches
>> with the suggested names.
>
> OK, let's do this sooner than later please, to make sure I have all your
> work in my tree, which is safer (consider the situation when dwmw2 picks
> what I have now and upstreams before we put everything in).

OK, I sent the necessary v2 patches. I just went with your names for
lack of a better idea.

I didn't send v2 of patches 13/14 and 14/14, since there was no
dependency. Let me know if I need to resend anything else.

Brian
