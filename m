Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtBIX-0006Vj-Bq
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 18:36:06 -0400
Received: by nf-out-0910.google.com with SMTP id p48so183633nfa
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jun 2006 15:35:43 -0700 (PDT)
Message-ID: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
Date: Wed, 21 Jun 2006 17:35:43 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Linux-MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: Current mtd tree is broken
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As panto pointed out on IRC today, the current MTD git tree is
completely broken for quite a few chip types.  Anything older than
Intel Sibley or P30 is broken since writesize is not set to something
other than 0 in the other cases.  This causes a BUG to trigger in
add_mtd_device because someone decided writesize == 0 was not a sane
thing.

I'm sure there are other things in drivers/mtd/chips/ or
drivers/mtd/devices/ that are broken as well.  Two things can happen:

1) Remove the BUG call and allow writesize == 0 to be valid.  This is
what was originally done and I didn't see a problem with that.

2) Fix the remaining drivers to set writesize to something other than 0.

josh
