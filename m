Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PdcU8-00040h-T5
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2011 05:46:05 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: J Barlow <jbarlow@ivl.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Fri, 14 Jan 2011 05:45:58 +0000
Subject: RE: What if the UBI flasher can't skip all-FF pages?
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093F9302E3@Cloud.RL.local>
In-Reply-To: <loom.20110113T232225-210@post.gmane.org>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> Artem Bityutskiy <dedekind1 <at> gmail.com> writes:

>> The original reason for writing this article was that some flashes
>> have write non-0xFF ECC to the OOB area when programmed with all
>> 0xFFs. But this case is easily testable.
>
> Isn't that possible for all ECC algorithms?  If the page has
> a bit stuck at 0,
> and is programmed to all 0xFFs, the ECC cannot possibly be all 0xFFs.

If the page has a bit which won't erase, the block should be marked bad and=
 retired, so correct ECC is not relevant.

An ECC algorithm that produced all-FF for all-FF input would be nice. I won=
der if some controllers implement this. You could do it just by XORing with=
 the binary-not of the underlying all-FF ECC signature. (This is just me th=
inking out loud about hardware I'd like to see, it doesn't help you).

> A long initial boot is not really a problem.  I was seriously
> considering this, but I realized that I could set up a platform
> specific workaround.  My bootloader can write UBIFS correctly, so all
> I need to do is reprogram every PEB in the UBI volume on the first
> boot before attempting to
> load Linux.

If that is a fresh mkfs.ubifs filesystem not many blocks will have a mix of=
 all-FF and not-all-FF pages, you only need to rewrite those blocks.
all-FF blocks I think you can just erase completely and UBI will put header=
s back on later (someone else may like to comment..)

Bear in mind what happens if you lose power or get reset while doing this p=
rocess. If you are planning to do it in the factory with a test after, shou=
ldn't be a problem.

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
