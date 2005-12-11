Received: from zproxy.gmail.com ([64.233.162.205])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElZM8-00049Y-53
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2005 17:07:48 -0500
Received: by zproxy.gmail.com with SMTP id i11so1310389nzi
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Dec 2005 14:07:42 -0800 (PST)
Message-ID: <625fc13d0512111407x3acc8b3fo467a6a5aaf6cec05@mail.gmail.com>
Date: Sun, 11 Dec 2005 16:07:42 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200512120653.33614.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <439821F4.7010403@yandex.ru>
	<200512111128.34835.manningc2@actrix.gen.nz>
	<439C2DA3.9090405@yandex.ru>
	<200512120653.33614.manningc2@actrix.gen.nz>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: NAND simulator
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/11/05, Charles Manning <manningc2@actrix.gen.nz> wrote:
> On Monday 12 December 2005 02:46, Artem B. Bityutskiy wrote:
> > Charles Manning wrote:
> > > Yes please.
> >
> > Uhh, will pospone this for now, will try to repair JFFS2 which doesn't
> > work after the last month's commits. Crud! Not sure whom to blame so fa=
r.
> >
> > > Can nandsim simulate storage larger than physical RAM (just swapping =
out)
> > > or would this need special support (eg. add some block device support=
?
> > > We're getting people in YAFFSland who are working with 8Gbytes of fla=
sh
> > > (and it will only get bigger!) and I expect you'd want large emulatio=
ns
> > > to stress JFFS3. Being able to simulate areas up to, say, 16Gbytes fo=
r
> > > now would be a nice thing.
> >
> > Well, did not plan it. But we probably may add this functionality. We
> > may borrow it from mtd2blk ...
> >
> > > A way of simulating a failure (bit flip, write error) would also be h=
andy
> > > for testing fs and ecc error handling.
> >
> > Yeah, good feature. But I'm not sure how to implement an interface for
> > this. It is probably easier to hack nandsim and add this manually...
>
> Manual hacking does work. I have done stuff like that in the past. Perhap=
s
> dynamic hacking could be done via procfs?
> eg, perhaps somethiong like
> echo "flip 12345 400 1" > /procfs/nandsim   # flip bit 1 in byte 400, pag=
e
> 12345

Sysfs would be better.  Or debugfs if you really want to be "Right
(tm)".  But the general idea is good.

josh
