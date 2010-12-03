Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POYI3-0005t4-JV
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 16:15:20 +0000
Received: by mail-bw0-f49.google.com with SMTP id 5so8811707bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 08:15:19 -0800 (PST)
Subject: Re: [PATCH] mtd: onenand: bugfix for 2x mode bad block handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1291296518-31566-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1291296518-31566-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 18:14:36 +0200
Message-ID: <1291392876.2365.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-02 at 15:28 +0200, Roman Tereshonkov wrote:
> This bug becomes visible in 2x mode when chip->writesize
> is different from mtd->writesize (= 2 * chip->writesize).
> At this case the bad block information is read from
> the first and the third physical pages instead of
> the first and the second as specification states.
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
