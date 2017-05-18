Received: from mail.sysgo.com ([176.9.12.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBMZP-00046K-C7
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 14:38:28 +0000
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
From: David Engraf <david.engraf@sysgo.com>
Message-ID: <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
Date: Thu, 18 May 2017 16:38:05 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
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

Am 18.05.2017 um 16:33 schrieb Richard Weinberger:
> David,
> 
> On Thu, May 18, 2017 at 3:38 PM, David Engraf <david.engraf@sysgo.com> wrote:
>> It is not possible to change permissions and ownership for symlinks in the
>> device table file. This patch adds support for symlinks equal to mkfs.jffs2
>> and updates the sample device table file.
> 
> I'm confused, permissions of a symlink are irrelevant.
> What is the usecase?
> 

You're right the permissions are ignored for symlinks but the user and 
group id is used. Without this flag mkfs.ubifs takes uid/gid from the 
local system.

Best regards
- David
