Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm8of-0004Ko-T6
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 08:04:23 -0500
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <45619C60.7070400@ru.mvista.com>
References: <20061117184055.569da7ad@localhost.localdomain>
	<1163855713.5597.70.camel@sauron>
	<1163856784.20835.2.camel@zod.rchland.ibm.com>
	<1163856955.5597.71.camel@sauron>  <45619C60.7070400@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 20 Nov 2006 14:46:59 +0200
Message-Id: <1164026819.5597.88.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-11-20 at 15:15 +0300, Vitaly Wool wrote:
> B/c it introduces new fields in generic mtd structures which are already=20
> overcomplicated, and modifies a lot of generic code. I'd expect that=20
> with this patch applied stuff like mtdcore.c and mtdpart.c becomes=20
> exposed to possible licensing issues which is definitely not what we aim =
;-)

I am talking about something like this:

http://lists.infradead.org/pipermail/linux-mtd/2004-May/009683.html

I do not see it introducing any new field.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
