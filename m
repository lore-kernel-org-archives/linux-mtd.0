Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXb7x-0000tW-7B
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 14:01:51 +0000
Received: by pzk33 with SMTP id 33so908649pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 06:01:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100120134142.GE30789@shareable.org>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<20100120134142.GE30789@shareable.org>
Date: Wed, 20 Jan 2010 22:01:43 +0800
Message-ID: <2c3b11251001200601v5b04a87er4b785e4d932edf14@mail.gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
From: Liu Hui <onlyflyer@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

http://kerneltrap.org/node/6741
In this article, it said:"Disks assure atomicity at the sector level.
This means that a write to a sector either goes through completely or
not at all."

I also know, some transaction based file system depend on the atomic
sector write feature of hard disk.

But I am not very confirmed about this...

2010/1/20 Jamie Lokier <jamie@shareable.org>:
> Liu Hui wrote:
>> This is a question confused me for a long time. As I know, writing a
>> sector for a hard disk is atomic. That is to say, when we are writing
>> a sector to hard disk and power failure happen, the sector will be
>> written completely or not at all.
>
> Are you sure about that?
> I have never seen a reliable confirmation of it.
>
> -- Jamie
>



-- 
Thanks & Best Regards
Liu Hui
--
