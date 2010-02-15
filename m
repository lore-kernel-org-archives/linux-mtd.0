Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh19U-0001oC-0h
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 13:38:20 +0000
Subject: Re: Fix mtd-utils bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>
In-Reply-To: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
References: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Feb 2010 15:36:52 +0200
Message-ID: <1266241012.11659.90.camel@localhost>
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

On Wed, 2010-02-03 at 12:45 +0800, Stanley.Miao wrote:
> (Re-send it because the previous one don't have a subject.)
> 
> During some BSP development process, I found some tools in mtd-utils
> contain legacy interfaces and it is not suitable with the current linux
> kernel. I post my patches here in case somebody else need them.

In general, I really support your "let's kick ancient crap out"
approach.

But could you please be a bit more verbose, and sell your patchset a bit
better. E.g., write about who will suffer - which kernel versions? Why
you think we should not care about them suffering?

Please, write a good explanation. Then I'll try to bug dwmw2 to ack or
nack this. And then I can push it.

Although I have push rights to the mtd-utils, but I am a bit usure about
pushing your stuff.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
