Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oj7sy-00015R-S1
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2010 09:46:15 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Class: urn:content-classes:message
Date: Wed, 11 Aug 2010 10:46:06 +0100
Subject: RE: How to stop mtd char device generating ECC on writes?
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903DC232C@Cloud.RL.local>
In-Reply-To: <4C6270A9.5090606@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET wrote:
> Jon Povey a =E9crit :
>> - Does MTD support what I'm trying to do from userland?
> yes write in raw mode + MEMWRITEOOB. But you will need 2 number of
> program.

Thanks Matthieu.

Sod's law, I actually found the answer a few minutes after sending the emai=
l..
Realised I hadn't tried "--noecc --raw" combination of switches. Works grea=
t.

Sorry for noise, hopefuly some archive reader can learn from my mistake.

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
