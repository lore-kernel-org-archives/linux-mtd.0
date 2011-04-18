Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBoek-0003Mb-Bn
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 13:38:22 +0000
Received: by ewy3 with SMTP id 3so1554141ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 06:38:20 -0700 (PDT)
Subject: RE: UBI partitioning in embedded device?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1104181531260.30071@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
	<0A40042D85E7C84DB443060EC44B3FD32A6941578B@dekaexchange07.deka.local>
	<Pine.LNX.4.64.1104181449160.30071@lnxricardw.se.axis.com>
	<1303131675.8589.7.camel@localhost>
	<Pine.LNX.4.64.1104181531260.30071@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 16:35:26 +0300
Message-ID: <1303133726.8589.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Atlant Schmidt <aschmidt@dekaresearch.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 15:33 +0200, Ricard Wanderlof wrote:
> I think what I'm most worried about is some bug in UBI causing the 
> critical data to be lost at some point. And as you said, some form of 
> backup would definitely help.

Well, good testing and redundancy would be the answer...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
