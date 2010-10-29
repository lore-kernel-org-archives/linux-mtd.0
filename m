Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PBoqu-0002gw-7p
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2010 13:18:41 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Ketil Froyn <ketil@froyn.name>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Fri, 29 Oct 2010 14:18:37 +0100
Subject: RE: Cross compiling mtd-utils for Android and pread errors
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EEF9619@Cloud.RL.local>
In-Reply-To: <AANLkTinNUrQKg_8EgwW5k7BZFiik5ish6-z+qK-=3qpU@mail.gmail.com>
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
> pread: Not a typewriter / #
>
> I'm grateful for any tips that can nudge me in the right direction.

"Not a typewriter" is ENOTTY, i.e. ioctl not supported.

Seems your android mtd devices don't support those ioctls.


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
