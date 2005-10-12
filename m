Received: from zproxy.gmail.com ([64.233.162.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPmY5-0003kq-P3
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 15:46:16 -0400
Received: by zproxy.gmail.com with SMTP id i11so190218nzh
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Oct 2005 12:46:00 -0700 (PDT)
Message-ID: <6934efce0510121245j55a7869cu56b4e5ff293c818c@mail.gmail.com>
Date: Wed, 12 Oct 2005 12:45:59 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: yogesh@ureach.com
In-Reply-To: <200510120528.BAA04869@www23.ureach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <200510120528.BAA04869@www23.ureach.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> i'm new to the mtd . i wanted to know how mtd read and write
> function called .

For examples look at the fs/jffs2 source look for mtd->read and mtd->write.

You probably don't need to use those unless you are creating a filesystem.
