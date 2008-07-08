Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KGCTx-00088Q-1r
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 12:39:45 +0000
Subject: Re: [UBI][WL][PATCH] Rewrite the UBI wear-leveling unit
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1215519259.2706.19.camel@localhost.localdomain>
References: <1215519259.2706.19.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2008 15:35:33 +0300
Message-Id: <1215520533.14618.24.camel@sauron>
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

Dear Xiaochuan-xu,

in general, I am interested in your work. However, I have
difficulties understanding your mails.

On Tue, 2008-07-08 at 20:14 +0800, xiaochuan-xu wrote:
> I've commit my patch to the 'ubi-2.6.git'.

You cannot commit anything to my repository because you have no
permission for this. And git does not work this way. What you should
rather do is to create your own clone of ubi-2.6.git repository, and
then I could pull from it. You should read more about git and kernel
development/submission.

Or just send patches.=20

The patch you have sent is very strange. Did you look at your own mail?
Did you see that you repeat the same stuff many times? Did you try to
take your own mail and apply your own patch? Try this. We use git-am
command for this. It won't apply because it is line-wrapped. Could you
please be more careful with these things?

Anyway, can we start from the following things:

1. Describe the problems of current algorithm.
2. Describe your new algorithm and how it solve the problems of the
current one.

After we (I and other people on the list) understand what you have done,
we can try to adopt your code.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
