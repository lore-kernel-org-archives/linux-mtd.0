Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hocvc-0000G7-H7
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 06:09:50 -0400
To: MikeW <mw_phil@yahoo.co.uk>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: When to use mtd.h or mtd-user.h 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Tue, 15 May 2007 15:09:14 -0000."
	<loom.20070515T170629-855@post.gmane.org>
Date: Thu, 17 May 2007 12:09:52 +0200
Sender: wd@denx.de
Message-Id: <20070517100952.9ACCA3525D5@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <loom.20070515T170629-855@post.gmane.org> you wrote:
> I note some applications for running in userspace say:
> #include <linux/mtd/mtd.h>
> and some say
> #include <mtd/mtd-user.h>
> 
> Which is the recommended usage, and why ?

<linux/mtd/mtd.h> used to be used on very old (2.4) kernel versions;
<mtd/mtd-user.h> has to be used now.


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The biggest difference between time and space is that you can't reuse
time.                                                 - Merrick Furst
