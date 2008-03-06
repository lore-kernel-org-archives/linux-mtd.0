Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXGVR-0001Ap-EL
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 13:51:33 +0000
Subject: Re: UBI: question about ubi_leb_change
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10803060539y16c65e26o181ef7b26ce008cf@mail.gmail.com>
References: <bae050c10803060426l2b90f9e2n4a0cd3e0dd1c4d19@mail.gmail.com>
	<1204807835.23706.38.camel@sauron>
	<bae050c10803060539y16c65e26o181ef7b26ce008cf@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Mar 2008 15:50:57 +0200
Message-Id: <1204811457.23706.49.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-03-06 at 21:39 +0800, Nancy wrote:
>    Yes, but in FTL layer, it don't know whether the old mapped LEB is
> useful or not until
> the new mapped LEB which data stored in a write_cache have to be write
> to PEB. The
> write_cache maybe full filled with new data or just a little new data,
> others have to be read from the old mapped PEB

Ok, probably I understand what you are talking about. If you have a huge
file, and you remove it, the file-system does few changes in meta-data,
and that's it. Right, FTL does not know that the FS blocks the contents
of the file are stored at, are now in fact obsolete.

But UBI in now way can help you to solve this problem. How could it?
Invent an interface which would help.

The only way to go is to teach the FS which sits on top of you to inform
you about all blocks which become free when something is deleted. But
the existing FSes do not do this. An yes, this means you'll move garbage
all over the place, which is slow.

This is why we started UBIFS instead of doing FTL - because we assumed a
native FS should be significantly more efficient then FTL.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
