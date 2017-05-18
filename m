Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBN33-00058X-4t
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 15:09:06 +0000
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: David Engraf <david.engraf@sysgo.com>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
 <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
 <d41978aa-9583-6a27-d992-77a49962daed@nod.at>
 <678b2b7a-4f2e-5bfe-1f10-61de599a59bb@sysgo.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <652cc3d4-10a2-d476-c4b1-63eff6aa2ea7@nod.at>
Date: Thu, 18 May 2017 17:08:41 +0200
MIME-Version: 1.0
In-Reply-To: <678b2b7a-4f2e-5bfe-1f10-61de599a59bb@sysgo.com>
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

Am 18.05.2017 um 17:03 schrieb David Engraf:
>>> You're right the permissions are ignored for symlinks but the user and group id is used. Without this flag mkfs.ubifs takes uid/gid from the local system.
>>
>> IMHO we can just force the uid/gid to 0, no?
> 
> Why? It doesn't make sense to have all uid/gid to 0. This should be decided by the user. The purpose of the device table file is to allow the user to specify the
> permissions/uid/gid to his requirements. mkfs.jffs2 handles it like that as well.

Since the ownership is ignored too, what is the usecase?

Thanks,
//richard
