Received: from smtp-out03.msg.oleane.net ([62.161.7.1])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8XQl-0001wY-EN
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 14:15:12 +0000
From: "Fabien Comte" <fabien.comte@ercogener.com>
To: <dedekind1@gmail.com>
References: <20120831133153.764EC3495D9@dl.free.fr>	
 <003d01cd877e$39b71020$ad253060$@ercogener.com>	
 <1346671221.3061.42.camel@sauron.fi.intel.com>
 <1346673285.3061.46.camel@sauron.fi.intel.com>
In-Reply-To: 
Subject: RE: TR: Notification d'envoi de fichier via http://dl.free.fr
Date: Mon, 3 Sep 2012 16:15:05 +0200
Message-ID: <001d01cd89de$84659fd0$8d30df70$@ercogener.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: fr
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

3.0, are you sure ?
http://git.infradead.org/users/dedekind/ubifs-v3.0.git
http://git.infradead.org/users/dedekind/ubifs-v3.5.git -> for 3.5 =
kernels, isn't it ?

Thank you.

Fabien Comte

-----Message d'origine-----
De : Artem Bityutskiy [mailto:dedekind1@gmail.com] Envoy=C3=A9 : lundi 3 =
septembre 2012 13:55 =C3=80 : Fabien Comte Cc : linux-mtd Objet : Re: =
TR: Notification d'envoi de fichier via http://dl.free.fr

On Mon, 2012-09-03 at 14:20 +0300, Artem Bityutskiy wrote:
> Also, you never sent me the full log. Please, _before_ mounting,=20
> enable debugging prints:
>=20
> 1. modprobe ubifs
> 2. echo 'format "UBIFS DBG" +pf' >
> /sys/kernel/debug/dynamic_debug/control
> 3. mount
>=20
> then type "dmesg" and send full log please.

Also note, I am using x86_64 PC.

Can you try to take the ubifs-v3.0 tree and try to reproduce the issue?

If it is reproducible, then we can find the guilty commit using git =
bisect.

--
Best Regards,
Artem Bityutskiy
