Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqUwY-00007W-D3
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 18:52:55 +0000
Received: by wyh11 with SMTP id 11so298526wyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Aug 2011 11:52:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <949288.456441312791072729.JavaMail.weblogic@epml15>
References: <949288.456441312791072729.JavaMail.weblogic@epml15>
Date: Mon, 8 Aug 2011 11:52:52 -0700
Message-ID: <CAN8TOE8kvxPx5cZeza2thfPx=-XHL0GcU3zhvM7gp8L-xyD3sw@mail.gmail.com>
Subject: Re: MTD & LogFS - Is LogFS dead?
From: Brian Norris <computersforpeace@gmail.com>
To: indraneel.m@samsung.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 8, 2011 at 1:11 AM, INDRANEEL MUKHERJEE
<indraneel.m@samsung.com> wrote:
> I'm trying to use LogFS with MTD. But I can't seem to find the format uti=
l for LogFS. All the LogFS official links including
> http://logfs.org/logfs/
> http://logfs.org/cgi-bin/mailman/listinfo/logfs
> http://lazybastard.org/~joern/logfs1.pdf
> are down(been checking for some days now).
>
> Is no one maintaining LogFS anymore? Is it dead? Any pointers to the logf=
s-utils?

Don't know too much about this myself, but I was able to track down
some utils (via Wikipedia):
http://logfs-tools.sourcearchive.com/

It looks like development is not very active, but the developer, J=F6rn
Engel has appeared on this mailing list recently.

Brian
