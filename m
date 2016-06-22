Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFj2Y-0004xH-2d
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 14:22:02 +0000
Subject: Re: [RFC] Raising the UBI version
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57699356.4030802@nod.at> <20160622144344.07ba4d41@bbrezillon>
 <576A989A.6080502@nod.at> <20160622160118.28a4339a@bbrezillon>
 <576A9B1D.3010201@nod.at> <20160622161304.6a16da85@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Alexander Kaplan
 <alex@nextthing.co>, Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576A9EF0.9020007@nod.at>
Date: Wed, 22 Jun 2016 16:21:36 +0200
MIME-Version: 1.0
In-Reply-To: <20160622161304.6a16da85@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.06.2016 um 16:13 schrieb Boris Brezillon:
>> /sys/class/ubi/version is the version of the UBI implementation,
>> not the version of the attached UBI image.
>> It will the here as soon you load the UBI module.
> 
> Do we have /sys/class/ubi/ubiX/version for the UBI image version?

No. That's why I plan to add /sys/class/ubi/ubiX/features_used to
show which features the attached UBI image requested.
And having a /sys/class/ubi/ubi/features which denotes what features
the _implementation_ supports.

> This is still unclear to me why we need to version the
> user-space/kernel-space ABI, since it's supposed to be backward
> compatible, so adding new features requires adding new ioctls and
> keeping the old ones in a working state.
> 
> What is /sys/class/ubi/version actually encoding? Isn't it encoding the
> fact that a specific UBI implementation is supporting all UBI on-flash
> formats up to format version X (that was my understanding)?
> 

Well, /sys/class/ubi/version exports UBI_VERSION from ubi-media.h.
It is (ab)used to encode the ABI version *and* the on-flash version.
The problem is that mtd-utils libubi will refuse to work with
/sys/class/ubi/version unequal 1.

Here the gem from libubi:
        if (read_positive_int(lib->ubi_version, &version))
                goto out_error;
        if (version != LIBUBI_UBI_VERSION) {
                errmsg("this library was made for UBI version %d, but UBI "
                       "version %d is detected\n", LIBUBI_UBI_VERSION, version);
                goto out_error;
        }

This is why I want to hardcode it to 1.
Everything else will break existing user space in some way.
10 years ago /sys/class/ubi/version seemed like a good idea
but now it hits us hard.

Thanks,
//richard
