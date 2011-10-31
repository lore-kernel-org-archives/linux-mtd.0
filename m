Received: from mout01.rz-online.net ([212.7.160.41])
 by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RKw1E-0006VX-AT
 for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 17:51:33 +0000
Received: from goemail-server.goerlitz.int (dns.wuppertal.de [217.146.148.195]
 (may be forged)) (authenticated bits=0)
 by mout01.rz-online.net (8.14.0/8.12.10) with ESMTP id p9VHpQIb032322
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Mon, 31 Oct 2011 18:51:26 +0100
From: Stelling Carsten <Carsten.Stelling@goerlitz.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: Security enhancement for UBIFS with secure erase feature
Message-ID: <02855DE82B1CA94A9115CCD637A132564B318B9FE3@goemail-server.goerlitz.int>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
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
Date: Mon, 31 Oct 2011 17:51:34 -0000

> However, I do not know if anyone will use this, hopefully yes!
Opened the thread in September, I know someone who 'll use it.
Joel, I haven't started development jet, and it's fine to hear that re-inve=
nting the wheel is not necessary.

Carsten

-----Urspr=FCngliche Nachricht-----
Von: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.=
infradead.org] Im Auftrag von Artem Bityutskiy
Gesendet: Sonntag, 30. Oktober 2011 13:52
An: Joel Reardon
Cc: linux-mtd@lists.infradead.org
Betreff: Re: Security enhancement for UBIFS with secure erase feature

Hi Joel,

On Thu, 2011-10-27 at 09:33 +0000, Joel Reardon wrote:
> So coincidentally I've been working on a secure deletion patch for=20
> UBIFS. (I'm a grad student researching secure deletion here in=20
> Zurich.) I'm mostly finished implementing it and the results are=20
> really good. It works by encrypting each data node individually with a=20
> different key, storing the keys in a (logically) fixed area, and then=20
> periodically atomically updating the key blocks to purge the old=20
> unwanted keys.

Sounds like a clever solution! It is curious to see how you made sure that =
all this is power-cut safe.

> I have a couple questions to ask the main developer, mostly about=20
> orphans for which I found the documentation not quite clear. I'm quite=20
> keen to get this integrated into UBIFS, however this will be the first=20
> time I've contributed to the kernel so in this regard I'm unsure of=20
> the best practices and so forth.

Well, ask questions, send patches. This sounds very interesting.
However, I do not know if anyone will use this, hopefully yes!

Artem.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
