Received: from mail-iw0-f196.google.com ([209.85.223.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MlJjh-0002km-EK
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 09:45:13 +0000
Received: by iwn34 with SMTP id 34so1645282iwn.25
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Sep 2009 02:45:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1252390936.5060.47.camel@localhost>
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
	<1252390936.5060.47.camel@localhost>
Date: Wed, 9 Sep 2009 17:45:06 +0800
Message-ID: <2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
Subject: Re: UBIFS power cut issues
From: JiSheng Zhang <jszhang3@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

2009/9/8 Artem Bityutskiy <dedekind1@gmail.com>:
> Hi,
>
> sorry for late answer, was very busy.
>
> On Wed, 2009-09-02 at 17:35 +0800, JiSheng Zhang wrote:
>> If we cut power when copy file into ubifs, then remount ubifs and try
>> to read the file, we found that the data at some offset of the file
>> began different from the data of the original file at the same offset.
>> Is this a bug of ubifs?
>
> This is expected behavior on any asynchronous FS. You may switch to
> synchronous behavior with '-o sync' mount option. I wrote a lot of

I have tested with "mount -o sync", the result is the same. It's not
empty file. For example:
cp fileA /mnt/ubifs/fileB
random cut power before "cp" completed.
then remount
>From head of /mnt/ubifs/fileB to some offset offsetC is the same as
fileA. But from offsetC to the end is different from fileA at the same
offset offsetC, it's not empty either.
Hope I expressed myself clearly.

> docs about write-back and the related issues. Dig UBIFS docs and FAQ.
> E.g.:
>
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
>
> If you have a _specific_ question, feel free to ask, of course. But
> for this general question I do not have a better answer than RTFM
> :-)))
>
>> PS:how do you test data integrity of ubifs under power loss?
>
> We mostly checked it using either 'integck' (see mtd-utils) or
> 'fsstress' (see LTP). We ran those tests and cut power off at random
> points using these devices:
>
> http://www.cpscom.com/gprod/ipn.htm
>
> Then we mounted the FS. We did not really check the contents of the
> FS, because it is not simple and tricky, but we checked that it mounts,
> re-mounts, and files are readable/writable/deletable.

Thanks for this information.

Regards,
Jisheng
