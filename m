Received: from mail.sysgo.com ([176.9.12.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBMyC-0000ad-4G
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 15:04:05 +0000
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
 <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
 <d41978aa-9583-6a27-d992-77a49962daed@nod.at>
From: David Engraf <david.engraf@sysgo.com>
Message-ID: <678b2b7a-4f2e-5bfe-1f10-61de599a59bb@sysgo.com>
Date: Thu, 18 May 2017 17:03:42 +0200
MIME-Version: 1.0
In-Reply-To: <d41978aa-9583-6a27-d992-77a49962daed@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Am 18.05.2017 um 16:47 schrieb Richard Weinberger:
> David,
> 
> Am 18.05.2017 um 16:38 schrieb David Engraf:
>>> I'm confused, permissions of a symlink are irrelevant.
>>> What is the usecase?
>>>
>>
>> You're right the permissions are ignored for symlinks but the user and group id is used. Without this flag mkfs.ubifs takes uid/gid from the local system.
> 
> IMHO we can just force the uid/gid to 0, no?

Why? It doesn't make sense to have all uid/gid to 0. This should be 
decided by the user. The purpose of the device table file is to allow 
the user to specify the permissions/uid/gid to his requirements. 
mkfs.jffs2 handles it like that as well.

Best regards
- David
