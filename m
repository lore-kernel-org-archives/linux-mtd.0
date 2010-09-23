Received: from if09-mail-fb04-mia.mta.terra.com ([208.84.243.228])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyl2f-0001C8-KL
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:36:50 +0000
Received: from if05-mail-sr03-mia.mta.terra.com
	(if05-mail-sr03-mia.mta.terra.com [208.84.243.60])
	by mail-fb04-mia.tpn.terra.com (Postfix) with ESMTP id 70A0C400663C
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 12:16:03 +0000 (UTC)
Message-ID: <F42FA4FD208F41E8891EB2BF9C7E62CB@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: "Wolfram Sang" <w.sang@pengutronix.de>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR>
	<20100923120534.GD2994@pengutronix.de>
In-Reply-To: <20100923120534.GD2994@pengutronix.de>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 09:15:31 -0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Yegor Yefremov <yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wofram,

  Thanks for your response. What do you mean by broken CFI?
  Also, as you seem with way more experience than me, do you know if 
cfi_probe do 3 cycle command for SST CFI Query Entry?
  If you could check: http://www.sst.com/dotAsset/40483.pdf
  Give me your thoughts about it

Regards,
  Flavio

----- Original Message ----- 
From: "Wolfram Sang" <w.sang@pengutronix.de>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: "Yegor Yefremov" <yegorslists@googlemail.com>; 
<linux-mtd@lists.infradead.org>
Sent: Thursday, September 23, 2010 9:05 AM
Subject: Re: [Help] SST39VF6401B Support
