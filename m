Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OybIj-0007jV-OE
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:12:47 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Class: urn:content-classes:message
Date: Thu, 23 Sep 2010 03:12:40 +0100
Subject: RE: flash_erase vs flash_eraseall
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093ED5FAA4@Cloud.RL.local>
In-Reply-To: <AANLkTi=aau=APUV0CUn1=xbV527CjvGgfci7NujA_nj_@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> On Wed, Sep 22, 2010 at 21:57, Jon Povey wrote:
>> I needed more control knobs than mtd-utils supported, I ended up
>> writing my own "flashtool" combining flash_erase and flash_write
>> features. I don't know if I can publish the source, but it does
>> things like optionally erase blocks as it goes along writing, just
>> as many as it needs, option to skip or fail on bad blocks, absolute
>> maximum offset limit, UBI image writing mode (skip trailing all-FF
>> pages in a block) and a couple of other things.
>>
>> It can also do software-generated ECC, rearrange the data/OOB and
>> write raw (to write layouts not supported by MTD) but that's very
>> device-specific.
>
> usually for upgrade cycles, i let the kernel do the erase+write for me
> (/dev/mtdblock#).  but i know some people would rather have a tool to
> do it for them.

Oh, I'm not very familiar with mtdblock, didn't think of it. Maybe I
could have saved some effort.
How does it handle bad blocks, I wonder out loud to the list?
I have to fail if I hit a bad block in some situations, writing images
for a tiny bootloader that can't skip bad blocks.

> in the case of the OOB, i did come across a case there too where it
> would be useful if could be transparently generated and overlaid on
> the fly ... -mike

The MTD side is pretty easy. Figuring out the inverse of the layout
transformation and implementing the ECC algorithm in software, bakes
your noodle.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
