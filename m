Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESeNB-0004tT-Ks
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 13:38:38 -0400
Received: by zproxy.gmail.com with SMTP id s18so283761nze
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2005 10:38:21 -0700 (PDT)
Message-ID: <6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
Date: Thu, 20 Oct 2005 10:38:21 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Could you double check with other flash model docs please?
>
> I don't have the Intel M18/M30 documentation handy but I think the
> current code is right in that case.

P and M do differ in this spec.  Sigh.  We'll get a patch out today or tomo=
rrow.
