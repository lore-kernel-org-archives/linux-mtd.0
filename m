Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PH1f4-0000xV-46
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 21:59:58 +0000
Received: by wwi17 with SMTP id 17so2560325wwi.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2010 13:59:56 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 12 Nov 2010 16:59:55 -0500
Message-ID: <AANLkTinOknf6VGWwPXjmcRv6Bhg=Qw4ErrXuuuK4OF0X@mail.gmail.com>
Subject: severity of bug fixed with commit 180c09d
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can someone explain the severity of this bug?  It was fixed in
ubiformat.c in mid-January of this year.  I'm using ubiformat from
prior to this fix and do not see the problem that is described in the
commit log.  I'm trying to understand the bug in order to explain why
I'm not seeing the problem and to determine if I'm susceptible to the
bug.

Thanks,
twebb
