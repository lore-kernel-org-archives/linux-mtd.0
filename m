Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Or03R-0002pE-Qt
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 03:01:34 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Content-Class: urn:content-classes:message
Date: Thu, 2 Sep 2010 04:01:25 +0100
Subject: RE: mkfs.ubifs generating bad CRCs
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903E0316F@Cloud.RL.local>
In-Reply-To: <1283340966.1958.21.camel@brekeke>
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

Artem Bityutskiy wrote:
> On Tue, 2010-08-31 at 11:57 +0100, Jon Povey wrote:
>> Building mkfs.ubifs from today's mtd-utils git I get a mkfs.ubifs
>> that seems to generate bad CRCs.
>
> Fixed in current mtd-utils.git

Great, thanks! I can confirm that fixes it.

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
