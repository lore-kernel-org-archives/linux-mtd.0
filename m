Received: from msr37.hinet.net ([168.95.4.137] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177tbG-0001VJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 08:53:30 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: MTD on L7205DB and AM29LV160DT 
Date: Wed, 15 May 2002 15:53:03 +0800
Message-ID: <000801c1fbe5$91b67160$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <21198.1021446668@redhat.com>
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

Sorry, I think about other chip, MX29LV160BT.

Steve Tsai


-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of David
Woodhouse
Sent: Wednesday, May 15, 2002 3:11 PM
To: Steve Tsai
Cc: yuanfei@eware.com.sg; Linux MTD mailing list
Subject: Re: MTD on L7205DB and AM29LV160DT 




startec@ms11.hinet.net said:
> MTD distribution does not support AM29LV160DT, so you have to tell mtd

> how to recognize the flash(jedec_probe.c)

jedec_probe has known about the AM29LV160DT since the first version.

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
