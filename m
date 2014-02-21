Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGlto-00040S-L5
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 08:56:01 +0000
From: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Date: Fri, 21 Feb 2014 09:55:28 +0100
Subject: AW: AW: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Thorsten Wiedemer wrote:
>=20
> We could reproduce the error now with function tracing enabled, so we hav=
e two hopefully valuable traces. But they are rather big (around 4MB each).=
 Shall I use pastebin and cut them in several peaces to provide them? Or of=
f-list as email attachment?
>

Here I have the last parts of the two hopefully "valuable" traces. The piec=
es show what happens between the leb_write_lock() und the leb_write unlock(=
) of the process which triggers the oops.
If this is not enough, I can provide also more ...
Take care of the PIDs, there are several processes with the same name runni=
ng.
Boths traces did not result from identical test cases, so there are some di=
fferent processes running.

The part of the first trace fits in one paste:

http://pastebin.com/TL3yNVcw

The part of the second trace is bigger than 500k, so split into two pastes.

http://pastebin.com/1qMt0Pqg
http://pastebin.com/ZLXU17wx

We'll have a closer look at that.

Regards,
Thorsten


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
