Received: from an-out-0708.google.com ([209.85.132.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFqgQ-0005We-08
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 12:51:01 +0000
Received: by an-out-0708.google.com with SMTP id c3so220287ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 04:50:52 -0800 (PST)
Date: Fri, 18 Jan 2008 06:48:52 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080118064852.026b0c82@zod.rchland.ibm.com>
In-Reply-To: <479073D1.5010406@parrot.com>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<479073D1.5010406@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 Jan 2008 10:39:29 +0100
Matthieu CASTET <matthieu.castet@parrot.com> wrote:

> Josh Boyer wrote:
> > On Thu, 17 Jan 2008 17:26:01 +0100
> > J=C3=B6rn Engel <joern@logfs.org> wrote:
> >=20
> >>> If we do a ls without waiting that jffs2_garbage_collect_pass finish,=
 ls=20
> >>> takes 12 minutes to complete.
> >> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
> >=20
> > How do you know?  A 200MiB file will likely have around 50,000 nodes.
> Yes the file got 41324 nodes.

Wow, I'm surprised I actually got close with my top of the head math :)

> > If the summary stuff is incorrect, and since we have no idea what kind
> > of platform is being used here, it may well be within reason.
> >=20
> The summary stuff is correct (I check it with a parser on a dump of the=20
> image). Also if the summary wasn't correct, only the mount time will grow=
 ?

Yes, you're correct.

> In my case the mount is ok : less than 5-10s.
> The platform used is an arm926 @247 Mhz

Ok, so running at 247MHz your board has to calculate the CRCs on 41324
nodes before the file can be opened.  I have no idea how long that
should really take, but you're doing about 57 nodes per second if it's
taking 12 minutes.

As J=C3=B6rn and David suggested, do some profiling to see where it is
spending most of it's time.

josh
