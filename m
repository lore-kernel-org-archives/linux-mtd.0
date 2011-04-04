Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6fYe-0000HY-4n
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 08:54:52 +0000
Received: from [95.177.23.22] (helo=luce.racelogic.co.uk)
	by relay.timico.net with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.69) (envelope-from <Jon.Povey@racelogic.co.uk>)
	id 1Q6fYb-0003Pb-Kg
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 09:54:45 +0100
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Mon, 4 Apr 2011 09:54:43 +0100
Subject: UBIFS question, atomic file create/rename semantics
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093FAFC247@Cloud.RL.local>
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

I have a file I want to create on first-time boot on my system,
on UBIFS. It's done in a shell script, and the logic is something like

if [ ! -e $FILE ]
then
        # create the file
fi

Once or twice this file has turned out to be zero length (or possibly
contain nulls, I am working on slightly vauge reports).

Looking into the issues of sync and semantics, I think this is related
to not doing sync and rename.
The script was pretty much just saying "prog > $FILE" and no sync.

I came up with the following and would appreciate any comments about
how reliable this should be:

if [ ! -e $FILE ]
then
        prog > $FILE.tmp
        sync
        mv $FILE.tmp $FILE
        sync
fi

My understanding is that as the .tmp file is on the same filesystem
and I ran sync, the mv means the final file atomically either exists
with full correct contents, or will not exist at all (after surprise
power cycle during the process).

A quick "yes, fine" or "won't work" would be appreciated.

Thanks,

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
