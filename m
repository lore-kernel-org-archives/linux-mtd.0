Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MszHf-0004lo-UU
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 13:32:00 +0000
Subject: Re: UBI resizing tool
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnaud Mouiche <arnaud.mouiche@thomson.net>
In-Reply-To: <4AC357FD.3020205@thomson.net>
References: <4AC357FD.3020205@thomson.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Sep 2009 16:27:39 +0300
Message-Id: <1254317259.3778.128.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-09-30 at 15:07 +0200, Arnaud Mouiche wrote:
> Hello,
> 
> I see that almost everything is ready for a UBi resizing tool (kernel, 
> libubi, tests...) but no final user land tool like 'ubirmvol'
> do I miss something of not ?

Correct, we introduced the mechanisms, but never used it, so did not
implement any utility.

> I not, I have a patch ready to add a 'ubirsvol' tool, but if you want a 
> better name, just say it.

Sure, name is OK, just submit the patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
