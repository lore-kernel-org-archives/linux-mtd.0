Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4Pvj-0007VS-7X
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 02:44:48 +0000
Received: by fg-out-1718.google.com with SMTP id e21so3456745fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Apr 2010 19:44:44 -0700 (PDT)
Subject: Re: PATCH 1/7] ubi: logging feature for ubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <q2p6b5362aa1004120135l28e57df1kc51c284620ca0033@mail.gmail.com>
References: <q2p6b5362aa1004120135l28e57df1kc51c284620ca0033@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Apr 2010 05:44:41 +0300
Message-Id: <1271817881.11751.1366.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, rohit.dongre@samsung.com,
	brijesh.s.singh@gmail.com, linux-mtd@lists.infradead.org,
	rohitvdongre@gmail.com, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-04-12 at 14:05 +0530, Brijesh Singh wrote:
> Hi,
>     I am sending the patches that add logging support to UBI.
> 

Very quick comments.

1. I think UBIL should not be under #ifdef's, why do we need so many
   ifdefs around?
2. This is a lot of code, and a short doc what you do is really needed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
