Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGmVM-0004qN-O6
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 09:34:49 +0000
From: "Quiniou, Benoit (Lawo AG)" <Benoit.Quiniou@lawo.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>, "Bill
 Pringlemeir" <bpringlemeir@nbsps.com>
Date: Fri, 21 Feb 2014 10:28:57 +0100
Subject: RE: AW: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <9AA65D849A88EB44B5D9B6A8BA098E23046598AB92CB@Exchange1.lawo.de>
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
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
Content-Language: en-US
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

> The part of the first trace fits in one paste:
>=20
> http://pastebin.com/TL3yNVcw
>=20
> The part of the second trace is bigger than 500k, so split into two paste=
s.
>=20
> http://pastebin.com/1qMt0Pqg
> http://pastebin.com/ZLXU17wx
>=20
> We'll have a closer look at that.
>=20
> Regards,
> Thorsten

Hello mtd-linux mailing list,

My name is Benoit and I work together with Thorsten and Emanuel on this.
Eventhought  I am not a kernel expert, I try to take a deep look in the 2 f=
traces we've got, in order to find differences and similarities and maybe h=
ave a clue what happened differently in the failed operations.
I put my efforts looking at what happens between leb_write_lock and leb_wri=
te_unlock all over the traces (not only the partial traces commited to past=
ebin).
What I can already tell, is that in both traces, I can see ubifs_orphan_ op=
erations in very similar ways and only once in each traces :
1- 1 process invokes ubifs_add_orphan
... some processes invoke ubifs api...
2- 1 other process (a sync) invokes ubifs_oprhan_start_commit
... some processes invoke ubifs api...
3- a third process invokes ubifs_delete_orphan
... some processes invoke ubifs api...
4- the process in which the failure finally arises invokes leb_write_lock=20
(starting from here you can follow the trace in first pastebin, line 112)
... some processes invoke ubifs api...
5- sync process of 2- invokes ubifs_orphan_end_commit (line 614) and gets i=
nterrupted by other processes before it finishes (line 734 and several proc=
esses after that point). This process resumes at line 2336
... some processes invoke ubifs api in the meanwhile...
6- failing process finally comes to leb_write_unlock (line 4332) and goes t=
o the Oops.

I will continue to take deep look at traces to see if I find things more cl=
osely related to the semaphore you pointed out.

Regards,

Benoit Quiniou
