Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd2E4-0007zO-D7
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 19:53:29 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: docg3: remove invalid __exit annotations
References: <1427820817-9446-1-git-send-email-computersforpeace@gmail.com>
Date: Tue, 31 Mar 2015 21:53:00 +0200
In-Reply-To: <1427820817-9446-1-git-send-email-computersforpeace@gmail.com>
 (Brian Norris's message of "Tue, 31 Mar 2015 09:53:37 -0700")
Message-ID: <87wq1xt04j.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> The .remove callback may be used when detaching a device via sysfs, so
> we can't expect to free up this memory.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
