Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDDqc-0002gz-9E
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 10:12:11 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Ketil Froyn <ketil@froyn.name>
Content-Class: urn:content-classes:message
Date: Tue, 2 Nov 2010 10:11:41 +0000
Subject: RE: Cross compiling mtd-utils for Android and pread errors
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EEF9999@Cloud.RL.local>
In-Reply-To: <AANLkTikSjAaNYQ0VTNonziK+j8z9qCcJ+D963U1MQ7HW@mail.gmail.com>
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

Ketil Froyn wrote:
> On Fri, Oct 29, 2010 at 3:18 PM, Jon Povey
> <Jon.Povey@racelogic.co.uk> wrote:
>> linux-mtd-bounces@lists.infradead.org wrote:
>>> pread: Not a typewriter / #
>>>
>>> I'm grateful for any tips that can nudge me in the right direction.
>>
>> "Not a typewriter" is ENOTTY, i.e. ioctl not supported.
>>
>> Seems your android mtd devices don't support those ioctls.
>
> Hi Jon,
>
> Thanks for the response! I only get ENOTTY when dumping to file, but
> not when I try to dump output to a tty using:
>
> /sdcard/nanddump -a /dev/mtd/mtd0
>
> so it almost seems that the program is confused and tries to treat the
> output file like a tty when I run with -f.

strace can tell you what ioctl is failing on what file descriptor.

Happy sleuthing.




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
