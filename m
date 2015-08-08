Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZO9ia-0004mG-Ko
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 19:23:45 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 antoine.tenart@free-electrons.com
Subject: Re: [PATCH 2/2] nand: pxa3xx: Increase initial buffer size
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Sat, 08 Aug 2015 21:19:36 +0200
In-Reply-To: <1438612286-16070-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Mon, 3 Aug 2015 11:31:26 -0300")
Message-ID: <87r3ndk2pj.fsf@belgarion.home>
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

> The initial buffer is used for the initial commands used to detect
> a flash device (STATUS, READID and PARAM).
>
> ONFI param page is 256 bytes, and there are three redundant copies
> to be read. JEDEC param page is 512 bytes, and there are also three
> redundant copies to be read. Hence this buffer should be at least
> 512 x 3. This commits rounds the buffer size to 2048.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-
Robert
