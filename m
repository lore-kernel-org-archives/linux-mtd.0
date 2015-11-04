Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu5lk-0008EM-3J
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 21:39:00 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/6] mtd: pxa3xx_nand: Gate/ungate the NAND clock in
 suspend/resume paths
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-7-git-send-email-ezequiel@vanguardiasur.com.ar>
 <87ziyta2jn.fsf@belgarion.home>
 <CAAEAJfB2aW8OqVVJ1aXU-+4YLberrfmkyrcC0FC3dK4F_y-=_A@mail.gmail.com>
Date: Wed, 04 Nov 2015 22:31:51 +0100
In-Reply-To: <CAAEAJfB2aW8OqVVJ1aXU-+4YLberrfmkyrcC0FC3dK4F_y-=_A@mail.gmail.com>
 (Ezequiel Garcia's message of "Wed, 4 Nov 2015 18:26:05 -0300")
Message-ID: <87vb9ha1tk.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> On 4 November 2015 at 18:16, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> I'd say no, because we are gating the bus clock, not the interface clock.
> And in that case, my tests would have failed, and they didn't.

Then:
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

-- 
Robert
