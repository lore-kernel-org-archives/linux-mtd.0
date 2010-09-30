Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1AB7-0008BS-S2
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 03:51:31 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier@gentoo.org>, "dedekind1@gmail.com"
	<dedekind1@gmail.com>
Content-Class: urn:content-classes:message
Date: Thu, 30 Sep 2010 04:51:22 +0100
Subject: RE: [PATCH] nandwrite: add --nobad to write bad blocks
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EE3E0B8@Cloud.RL.local>
In-Reply-To: <AANLkTi=FD+8OyqQjUs7Y9+hS=fVgN+=s12M6tnAWH9Oy@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> On Wed, Sep 29, 2010 at 08:59, Artem Bityutskiy wrote:
>> But speaking about erasing bad eraseblocks, which we also discussed,
>> I think you have a good point - we should probably distinguish
>> between factory-marked bad eraseblocks and user-marked. AFAIR, the
>> OOB marker for them was even different, or in BBT, do not really
>> remember.

> i think you're correct here too.  i havent seen any indication that
> factory-marked bad blocks are distinguished in any way from
> user-marked bad blocks.  either in the software BBT or in the OOB
> layout. -mike

I remember reading somewhere that the BBT is designed to distinguish
them, e.g. here:
http://wiki.laptop.org/go/NAND_Flash_Bad_Block_Table#Bad_Block_Table_Format

I haven't looked in the code to see if that's actually used, though.


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
