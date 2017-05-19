Received: from mail.sysgo.com ([176.9.12.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBbAD-00054j-JZ
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 06:13:27 +0000
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
From: David Engraf <david.engraf@sysgo.com>
Message-ID: <9e37787a-3683-1417-a03e-8a00022a44ff@sysgo.com>
Date: Fri, 19 May 2017 08:13:03 +0200
MIME-Version: 1.0
In-Reply-To: <9e19f6f3-e825-72b4-cf5e-fea2c12a5c7e@nod.at>
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

Am 18.05.2017 um 17:43 schrieb Richard Weinberger:
> Am 18.05.2017 um 17:27 schrieb Richard Weinberger:
>> i.e.
>> rw@captainhero:/mnt/dir> id
>> uid=1000(rw) gid=100(users) groups=100(users)
>> rw@captainhero:/mnt/dir> ls -la
>> total 0
>> drwxr-xr-x 2 rw   root 240 May 18 17:23 .
>> drwxr-xr-x 3 root root 224 May 18 17:22 ..
>> lrwxrwxrwx 1 root root  11 May 18 17:23 s -> /etc/shadow
>> rw@captainhero:/mnt/dir> rm s
>> rw@captainhero:/mnt/dir> ls -la
>> total 0
>> drwxr-xr-x 2 rw   root 176 May 18 17:24 .
>> drwxr-xr-x 3 root root 224 May 18 17:22 ..
>> rw@captainhero:/mnt/dir>
>>
>> Although, user rw is not root, it can delete "s" which is owned by root
>> because rw has write permission on /mnt/dir.
> 
> BTW: My example is misleading. Same applies to regular files.
> Permissions and ownership of symlinks just don't apply.
> 
> Do you only care about the ls output or does one of your applications
> depend on it?

It's mainly the output of ls because I'm using a verify script checking 
ownership of each file. Without having the ability to set the ownership 
of symlinks it will fail because ls returns a uid/gid of my host 
development system which is not valid on the target.

Best regards
- David
