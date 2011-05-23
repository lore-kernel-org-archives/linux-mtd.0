Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOWvJ-0006Wn-1P
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 15:20:01 +0000
Received: by eyh6 with SMTP id 6so2131099eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 08:19:59 -0700 (PDT)
Subject: Re: [PATCH 01/62] mtd: always build partitioning support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-2-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
	<1306142623-24952-2-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 May 2011 18:15:46 +0300
Message-ID: <1306163746.2785.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-23 at 10:22 +0100, Jamie Iles wrote:
> There are very few situations where MTD partitioning is not required,
> and the benefit in code size reduction by making this configurable does
> not warrant the level of ifdeffery needed.

Amended commit message a bit and pushed to l2-mtd-2.6.git / jamie branch
so far.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
