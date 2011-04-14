Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAKsE-00047a-EV
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 11:38:11 +0000
Received: by eyh6 with SMTP id 6so493019eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 04:38:08 -0700 (PDT)
Subject: RE: I don't understand how the counter for erasures is being
	maintained during erase failures
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD328119F6E88@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD328119F6E7D@dekaexchange07.deka.local>
	<1302765211.2796.13.camel@localhost>
	<0A40042D85E7C84DB443060EC44B3FD328119F6E88@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 14:35:14 +0300
Message-ID: <1302780914.2796.18.camel@localhost>
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
> Artem:
> 
> > What is the flash? Is it MLC?
> 
> Today, unfortunately, yes, although our newest board
> revisions have switched to SLC and we're retrofitting
> the older boards as we can. But some of our systems
> will be living with MLC for a while yet.

BTW, in case you did not read that:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
