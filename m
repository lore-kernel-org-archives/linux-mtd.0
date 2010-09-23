Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oybl7-0007sE-HB
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:42:06 +0000
Received: by qyk35 with SMTP id 35so7104628qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Sep 2010 19:42:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED5FAA4@Cloud.RL.local>
References: <AANLkTi=aau=APUV0CUn1=xbV527CjvGgfci7NujA_nj_@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093ED5FAA4@Cloud.RL.local>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 22 Sep 2010 22:41:44 -0400
Message-ID: <AANLkTinXwAc4VRwN8G891-=2zLob=zwXrLoFGkT6eJC=@mail.gmail.com>
Subject: Re: flash_erase vs flash_eraseall
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 22, 2010 at 22:12, Jon Povey wrote:
> Mike Frysinger wrote:
>> On Wed, Sep 22, 2010 at 21:57, Jon Povey wrote:
>>> I needed more control knobs than mtd-utils supported, I ended up
>>> writing my own "flashtool" combining flash_erase and flash_write
>>> features. I don't know if I can publish the source, but it does
>>> things like optionally erase blocks as it goes along writing, just
>>> as many as it needs, option to skip or fail on bad blocks, absolute
>>> maximum offset limit, UBI image writing mode (skip trailing all-FF
>>> pages in a block) and a couple of other things.
>>>
>>> It can also do software-generated ECC, rearrange the data/OOB and
>>> write raw (to write layouts not supported by MTD) but that's very
>>> device-specific.
>>
>> usually for upgrade cycles, i let the kernel do the erase+write for me
>> (/dev/mtdblock#). =C2=A0but i know some people would rather have a tool =
to
>> do it for them.
>
> Oh, I'm not very familiar with mtdblock, didn't think of it. Maybe I
> could have saved some effort.
> How does it handle bad blocks, I wonder out loud to the list?
> I have to fail if I hit a bad block in some situations, writing images
> for a tiny bootloader that can't skip bad blocks.

good point ... i dont think it does.  i typically focus more on NOR
(parallel & SPI), so bad blocks arent usually a problem for me.
-mike
