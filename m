Received: from kynes.gatewest.net ([198.163.227.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16QXzi-0005b1-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2002 18:07:34 +0000
Received: from yahweh (h24-66-30-3.wp.shawcable.net [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g0FIKZSV014538
        for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2002 12:20:36 -0600
Content-Type: text/plain;
  charset="iso-8859-1"
From: Cam Mayor <cmayor@iders.ca>
To: linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: open question on flash speed/app blocking
Date: Tue, 15 Jan 2002 12:18:22 -0600
MIME-Version: 1.0
Message-Id: <02011512182209.16722@kilauea.iders.ca>
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,

We're making an app that periodically writes a persistance file to flash.=
  I=20
haven't actually gotten a flash file system area working yet on my board,=
 so=20
i can't test this yet for speed.   I know that the results will vary with=
 the=20
hardware, the filesystem used, and a handful of other factors.  I'm assum=
ing=20
that a write to the flash will be blocking - that is, nothing else will b=
e=20
allowed to happen on the bus while that function is being performed.

For a file the size of 32bytes, 1kByte, and 32kBtyes, what kind of blocki=
ng=20
delay might one expect from linux writing to flash for each of those file=
=20
sizes?  What would be an optimum flash filesystem to use for something li=
ke=20
this?  (if there is one)

cheers,
cam

ps. i'm using linux 2.4.6-rmk1-rayl1 and 2.4.16-rmk2.  I could use the la=
test=20
kernel, too, i just haven't gotten around to it.  For development purpose=
s,=20
i'm using a cirrus CDB89712 development board, which has the cs89712=20
processor and some Intel 28f320B3 flash on it.
