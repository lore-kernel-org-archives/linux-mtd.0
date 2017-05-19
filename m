Received: from mail.sysgo.com ([176.9.12.79])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBdZz-0002NA-2A
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 08:48:13 +0000
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
 <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
 <d41978aa-9583-6a27-d992-77a49962daed@nod.at>
 <678b2b7a-4f2e-5bfe-1f10-61de599a59bb@sysgo.com>
 <652cc3d4-10a2-d476-c4b1-63eff6aa2ea7@nod.at>
 <dc1e73ec-537b-8e23-6dab-0ce4c2e371a7@sysgo.com>
 <97e661e2-0648-e148-280b-8ff6cc9cbe09@nod.at>
 <9e19f6f3-e825-72b4-cf5e-fea2c12a5c7e@nod.at>
 <9e37787a-3683-1417-a03e-8a00022a44ff@sysgo.com>
 <3ecf5d12-6a22-58a2-b799-bd70a141a646@nod.at>
From: David Engraf <david.engraf@sysgo.com>
Message-ID: <6097f46d-d50a-2360-01a5-9fdec4ffd338@sysgo.com>
Date: Fri, 19 May 2017 10:47:45 +0200
MIME-Version: 1.0
In-Reply-To: <3ecf5d12-6a22-58a2-b799-bd70a141a646@nod.at>
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

Am 19.05.2017 um 10:24 schrieb Richard Weinberger:
> David,
> 
> Am 19.05.2017 um 08:13 schrieb David Engraf:
>>> Do you only care about the ls output or does one of your applications
>>> depend on it?
>>
>> It's mainly the output of ls because I'm using a verify script checking ownership of each file. Without having the ability to set the ownership of symlinks it will fail because ls
>> returns a uid/gid of my host development system which is not valid on the target.
> 
> this makes sense.
> 
> Please also massage this comment in devtable.c:
>   * Don't bother with symlinks (permissions are irrelevant), hard links (special
>   * cases of regular files), or sockets (why bother).

Okay.

> and make sure that the permissions are not set for symlinks.
> Otherwise I'd give users the impression that symlinks have permissions.

You mean the mode should be ignore in the device table for symlinks. 
This means the mode is taken from the original file and stored in the 
ubifs inode (add_inode()). This would be okay for me but what is ubifs 
doing with this information stored in its inode?

We could also force symlinks to 777 and return an error if the user 
tries to use a different value. What do you think?

Best regards
- David
