Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pca1y-0001oY-ML
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 08:56:43 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: David Lambert <dave@lambsys.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Tue, 11 Jan 2011 08:56:36 +0000
Subject: RE: Confusion over mkfs.ubifs versions
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093F92FD0E@Cloud.RL.local>
In-Reply-To: <4D2B79BF.6080304@lambsys.com>
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
> After upgrading to Ubuntu 10.10 I noticed that the stock mkfs.ubifs
> (version 1.3) failed to compute checksums correctly. I compiled my own
> version from the git source of mtd-utils which announces itself as
> version 1.4; this worked fine. Being curious I logged onto a machine
> running Ubuntu 10.4 and checked the version of mkfs.ubifs and
> also found
> it to be 1.3, but this version computes checksums correctly!
> Is there a
> sub-version of mkfs.ubifs between 1.3 and 1.4 that is not
> shown by using
> --version? Am I missing something critical here?

There was a time period a few months ago (not very specific, sorry)
when mkfs.ubifs checksums were indeed broken.

Unfortunate if the Ubuntu 10.10 stock version has that bug :/

Not tried it myself, though just put Ubuntu 10.10 on a machine here
and might be using it for dev so I'll bear that in mind. Thanks.

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
