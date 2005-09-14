Received: from mail.sysgo.com ([62.8.134.5])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFWTU-0004lp-10
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 08:35:23 -0400
Date: Wed, 14 Sep 2005 14:34:47 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050914120309.GB25468@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.63.0509141426340.26040@mag.sysgo.com>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
	<20050913230631.GB29579@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
	<20050914092634.GB22847@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509141136040.12001@mag.sysgo.com>
	<20050914120309.GB25468@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Sep 2005, J=F6rn Engel wrote:

> "if your write it portable in the first place" sounds nice, but noone
> really knows what that means, before the acid test happens.

I think this is a weak argument in this context. Sticking to the=20
standards should always be a prime directive for any programmer.=20
Moreover, /if/ I follow your argument: it's very unlikely something=20
happens to the semantics of (char*)buf + i, compared to the likelihood=20
of a future GCC discovering honour and making the extensions harder to=20
access.

Regards,
Marius

--=20
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.pikeos.com
