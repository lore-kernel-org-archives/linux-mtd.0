Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBMiW-0008Td-4Y
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 14:47:54 +0000
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: David Engraf <david.engraf@sysgo.com>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
 <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d41978aa-9583-6a27-d992-77a49962daed@nod.at>
Date: Thu, 18 May 2017 16:47:24 +0200
MIME-Version: 1.0
In-Reply-To: <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Am 18.05.2017 um 16:38 schrieb David Engraf:
>> I'm confused, permissions of a symlink are irrelevant.
>> What is the usecase?
>>
> 
> You're right the permissions are ignored for symlinks but the user and group id is used. Without this flag mkfs.ubifs takes uid/gid from the local system.

IMHO we can just force the uid/gid to 0, no?

Thanks,
//richard
