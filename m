Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhOhy-0008Pl-4R
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 12:38:22 +0000
Subject: Re: UBIFS: media format changes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <1207225950.3224.1.camel@vader.jdub.homelinux.org>
References: <1207222625.8040.4.camel@sauron>
	<1207225950.3224.1.camel@vader.jdub.homelinux.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 03 Apr 2008 15:38:47 +0300
Message-Id: <1207226327.8040.8.camel@sauron>
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

On Thu, 2008-04-03 at 07:32 -0500, Josh Boyer wrote:
> Is there a ubifs.fsck utility?  If so, could it be made to convert the
> old media format to the new?  Or am I living in a dream world? :)

No, we do not have ubifs.fsck, although there are plans to implement it
at some point. It is just not a thing which is urgently needed.

I think there are so few people who are trying it that it does not
really matter. I guess I did not even have send that note. :-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
