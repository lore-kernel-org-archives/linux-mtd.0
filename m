Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Tvyc-0002MH-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 02:20:26 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <sikenaga@mvista.com>, <linux-mtd@lists.infradead.org>
Subject: RE: Space Loss in JFFS on an EST-SBC8260
Date: Thu, 24 Jan 2002 18:23:30 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFMEKGDDAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <FFEBJPOLADLDEDEKEOGFKEJCCIAA.sikenaga@mvista.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

We have the exact same problem. (We are using the MTD/JFFS with the HHL 2.0
Professional distribution) I retrieved a copy of the latest code from CVS
and posted a message earlier today asking how to insert this code into a HHL
source tree. Do you have an idea? Have you tried the latest version of the
code with the same results?

Any help would be appreciated.

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Scott Ikenaga
> Sent: Thursday, January 24, 2002 8:29 AM
> To: linux-mtd@lists.infradead.org
> Subject: Space Loss in JFFS on an EST-SBC8260
>
>
> We are using JFFS on EST-SBC8260. The problem we are facing now is that
> the space can't be reclaimed after files being deleted. So we are
> running out of space as shown by "du".
>
> Questions:
> (1)Is this a known problem? If so, is there a fix?
> (2)Could this contribute to another problem where the system becomes
>    very sluggish?
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
