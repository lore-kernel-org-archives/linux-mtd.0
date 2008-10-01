Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kkucm-0006bS-Pc
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 05:51:49 +0000
Subject: For UBIFS users: be aware of write-back!
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2008 08:51:28 +0300
Message-Id: <1222840288.8051.24.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Bruce_Leonard@selinc.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this e-mail informs about a quite important UBIFS feature which
have already confused many people.

If you use UBIFS, and especially if you have been using JFFS2 before,
please, read this documentation entry:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

Please, remember that UBIFS is _asynchronous_ FS. JFFS2 was synchronous,
so expect some of your old applications which were fine on JFFS2 to be
not ready to handle power cuts correctly in case of UBIFS.

Just an unsorted list of important items:

* Every time you write to a file, please, ask yourself: "if a
  power cut happens now, is it OK if I loose data or that my file may
  contain garbage or be inconsistent afterward? Is my application=20
  ready to clean that up?"

* If your application changes a configuration file, you probably
  should use the "atomic file update" trick described at the web site.

* Keep the write-back issues in mind if you write scripts as
  well. In bash, use "sync" when needed. Smarter languages like
  Perl have more fine-grained and efficient calls.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
