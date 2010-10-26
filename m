Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAmOU-0005lH-Ie
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 16:29:05 +0000
To: dedekind1@gmail.com
From: Wolfgang Denk <wd@denx.de>
Subject: Re: UBIFS: mount based on UUID?
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <1288083795.2227.28.camel@localhost>
References: <20101026055332.B14FD152451@gemini.denx.de>
	<1288083795.2227.28.camel@localhost>
Date: Tue, 26 Oct 2010 18:29:00 +0200
Message-Id: <20101026162900.423EC1365D8@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem,

In message <1288083795.2227.28.camel@localhost> you wrote:
>
> No, you are right, we do have UUID, but we added it just in case we need
> it in the future, e.g., for NFS support, but we do not use it currently
> because we did not need it. And we did not look at mounting by UUID - it
> should be possible to do.

I see.

> I'm a bit overloaded at the moment, but if I have time later, I can look
> at it.

Thanks a lot.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Quote from a recent meeting:   "We are going to continue having these
meetings everyday until I find out why no work is getting done."
