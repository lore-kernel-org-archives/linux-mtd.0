Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUaTr-0002AQ-I6
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 08:20:44 +0000
Received: by fxm14 with SMTP id 14so1156338fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 01:20:42 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <BANLkTi=LJJTTr=SGmyfh3wDAvdg4+0SN3w@mail.gmail.com>
References: <20110608015625.GA27537@july> <1307530994.31223.46.camel@localhost>
	<BANLkTinOBRUiaAGrbPcxve-EzZN3YdS__g@mail.gmail.com>
	<1307539156.31223.69.camel@localhost>
	<BANLkTi=LJJTTr=SGmyfh3wDAvdg4+0SN3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 11:16:23 +0300
Message-ID: <1307607383.7374.50.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 15:12 +0900, Kyungmin Park wrote:
> BTW, as you mentioned, it's already checked. DeviceID is just
> capacity, I mean size is already checked and 4KiB pagesize is also
> checked by numbufs... So check the version ID is enough in this case?

Probably yes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
