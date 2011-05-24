Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOoif-0006sd-Kf
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 10:20:10 +0000
Received: by eyh6 with SMTP id 6so2408321eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 03:20:07 -0700 (PDT)
Subject: Re: nand_do_write_ops issue with writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF167@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF167@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 13:15:47 +0300
Message-ID: <1306232147.2785.94.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-24 at 12:13 +0200, THOMSON, Adam (Adam) wrote:
> Interestingly this issue was seen in 2007 on the following message thread:
>  
> http://www.aleph1.co.uk/lurker/message/20070702.153055.030a8b94.en.html

Probably it is time to send a patch then, if this is discussed from
2007 :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
