Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KDZJp-0006FT-9v
	for linux-mtd@lists.infradead.org; Tue, 01 Jul 2008 06:26:26 +0000
Subject: Re: GIT troubles at infradead?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF02AB95B1.1E50A1B0-ON88257478.0082C6C1-88257478.0082FA41@selinc.com>
References: <OF02AB95B1.1E50A1B0-ON88257478.0082C6C1-88257478.0082FA41@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 01 Jul 2008 09:23:55 +0300
Message-Id: <1214893435.6573.56.camel@sauron>
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


On Mon, 2008-06-30 at 16:50 -0700, Bruce_Leonard@selinc.com wrote:
> Is anyone else having trouble pulling trees via git from infradead.org?=20
> I've been trying to clone the ubifs-2.6 tree for most of the day and all=20
> it does is hang right after initializing the empyt repository on my=20
> machine.  git seems to be working from my end as I can pull down the=20
> latest vanilla kernel from kernel.org.

Does it happen when you pull mtd-2.6.git as well (may be I screwed up
ubifs-2.6.git)? Do you use --reference linux-2.g.git as it is said
here: http://www.linux-mtd.infradead.org/source.html ?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
