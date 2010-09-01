Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqpXj-0003FS-Te
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 15:48:09 +0000
Received: by qwe4 with SMTP id 4so7207772qwe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 08:48:07 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefani Seibold <stefani@seibold.net>
In-Reply-To: <1283256587.7515.16.camel@wall-e.seibold.net>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1280244117.3021.36.camel@localhost.localdomain>
	<1280296009.4310.5.camel@wall-e.seibold.net>
	<1282489456.16502.74.camel@brekeke>
	<1283256587.7515.16.camel@wall-e.seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 18:47:57 +0300
Message-ID: <1283356077.2209.19.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Kreuzer, Michael \(NSN - DE/Ulm\)" <michael.kreuzer@nsn.com>,
	linux-mtd@lists.infradead.org, "Pagliari,
	Vivenzio \(NSN - DE/Ulm\)" <vivenzio.pagliari@nsn.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2010-08-31 at 14:09 +0200, Stefani Seibold wrote:
> Am Sonntag, den 22.08.2010, 18:04 +0300 schrieb Artem Bityutskiy:
> > 
> > Yes, but your patch fixes the symptom, unfortunately. It is ok for you
> > to use as a work-around, but I still hope to find the root cause.

> True, but also if we fix the cause, this could happen. Imagine that one
> of the two master LEB will get corrupted, due a flash error or a power
> fail during a write access. Than the system should able to mount this
> damaged file system and restore the lost master LEB.

Firs of all, UBIFS _does_ handle the situation when on master LEB is
corrupted. It is designed for this and this part was tested. _But_ UBIFS
expects that the master LEB is corrupted in _certain way_. If it is
corrupted in an unexpected way - we panic.

To put it differently, we do not handle random corruptions, we handle
only corruptions which _look_ like corruptions caused by power cuts.

In your case you have very strange corruption. We can apply your patch,
problem solved, but will you be 100% comfortable with this? There is a
chance that you have some issues which can later have different
symptoms. I am still interested to find out the real root reason.

I will look at your issue as soon as I have time. I'm currently in
Brazil at the LinuxCon and do not have enough time to look at large
things so far.

> We should try to make UBIFS as robustly as possible and handle all
> possible errors.

Yes. But again, your case is a failure which does not look like a
corruption due to power cuts. In UBIFS we have certain expectations
about how Flash behaves, and we designed UBI/UBIFS around these
expectations. In your the corruption does not fit our expectations. So
we need to understand what happens. Then we can amend UBIFS expectation.

Thus, I think your patch should not be applied to upstream UBIFS
_before_ the reasons of the issue are fully understood.

Lets at least _try_, there is no guarantee we can find out what
happened, but lets try anyway.

> I think it is important to be a bit more defensive and assume the worst
> case.

We do try to be defensive - we refuse mounting if we see that the FS is
screwed in unexpected way. Instead of swallowing corrupted FS and
corrupting it even more - we refuse it. That's very defensive!

As I explained, we recover only if we see that the corruption looks like
the power-cut corruption.

I am actually trying to help you to find the real root cause. Sorry for
my stubbornness, but I really try to help.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
