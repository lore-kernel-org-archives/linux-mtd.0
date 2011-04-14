Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAKFR-0003jX-2h
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 10:58:05 +0000
Received: by eyh6 with SMTP id 6so483560eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 03:58:03 -0700 (PDT)
Subject: RE: I don't understand how the counter for erasures is being
	maintained during erase failures
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD328119F6E88@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD328119F6E7D@dekaexchange07.deka.local>
	<1302765211.2796.13.camel@localhost>
	<0A40042D85E7C84DB443060EC44B3FD328119F6E88@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 13:55:09 +0300
Message-ID: <1302778509.2796.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-14 at 06:53 -0400, Atlant Schmidt wrote:
> But the question I'll start-off with is: What specific
> step(s) is/are necessary to cause UBI to permanently
> consider this a bad block? 

When you fail to erase it or when torture test fails, AFAIR. Just find
all callers of 'ubi_io_mark_bad()'.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
