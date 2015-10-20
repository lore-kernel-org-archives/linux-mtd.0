Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zockf-0002pg-At
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 19:39:18 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
Date: Tue, 20 Oct 2015 21:33:12 +0200
In-Reply-To: <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
 (Ezequiel Garcia's message of "Thu, 15 Oct 2015 15:33:48 -0300")
Message-ID: <87vba1xrlz.fsf@belgarion.home>
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

> Robert:
>
> Can you test this on a platform with PM support, and make sure
> the NAND works fine after a resume?

Euh actually I can't. I'm only sure Suspend to RAM is working for pxa27x, I have
not yet this proof for pxa3xx, and my last try wasn't very successful 3 monthes
ago ...

As this regression might be within my platform's configuration (IPL setup, ...),
I don't yet know where the bug is.

Cheers.

--
Robert
