Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6fo3-0000Rh-2F
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 09:10:47 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Content-Class: urn:content-classes:message
Date: Mon, 4 Apr 2011 10:10:38 +0100
Subject: RE: UBIFS question, atomic file create/rename semantics
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093FAFC263@Cloud.RL.local>
In-Reply-To: <1301907564.2760.44.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2011-04-04 at 09:54 +0100, Jon Povey wrote:
>> I came up with the following and would appreciate any comments about
>> how reliable this should be:
>>
>> if [ ! -e $FILE ]
>> then
>>         prog > $FILE.tmp
>>         sync
>>         mv $FILE.tmp $FILE
>>         sync
>> fi
>
> It does not mean you should trust me and not test that, but I think
> "yes", your sequence should make it.

Thanks for the quick response!

I was not able to reproduce the "zero file" fault on the bench, if I
powered off shortly after the file was "created" before, on my bench
test it just didn't exist.

After this new code, it seems to reliably exist on flash as soon as
the block exists, so.. off to our testers to bang on it a bit.


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
