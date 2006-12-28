Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GzsBt-0007cA-AA
	for linux-mtd@lists.infradead.org; Thu, 28 Dec 2006 05:08:52 -0500
Subject: Re: OneNAND: soft lockup
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <3032008.882331167270436184.JavaMail.weblogic@ep_ml22>
References: <3032008.882331167270436184.JavaMail.weblogic@ep_ml22>
Content-Type: text/plain; charset=utf-8
Date: Thu, 28 Dec 2006 12:08:23 +0200
Message-Id: <1167300503.4217.21.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Kyungmin,

On Thu, 2006-12-28 at 01:47 +0000, Kyungmin Park wrote:
> hmm, after patch, it has a problem.
> How can I find the soft lockup?

Well, it's about calling cond_resched() in JFFS2's loops. Please, try
this patch.

P.S. Please, consider to use git-am (-i -s options are useful) when
applying patches, in this case you will end up with correct patch
author. For example, the author of this patch is incorrect at your tree:
http://git.infradead.org/?p=3Dusers/kmpark/onenand-mtd-2.6.git;a=3Dcommit;h=
=3Dfd9d42f16f1d98852a386c020dcd45d8c207d10d

For example, with the attached patch you can do:

git-am -i -s reschedule-in-loops.diff

Then press e, edit the commit message, and press y. Very handy tool.
Also, git-format-patch allows you to generate patches like that (with
From: and Subject: lines).

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
