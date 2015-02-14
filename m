Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMkX9-0007GI-AK
 for linux-mtd@lists.infradead.org; Sat, 14 Feb 2015 21:45:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: pxa3xx_nand: fix driver when num_cs is 0
References: <1423425729-20671-1-git-send-email-robert.jarzmik@free.fr>
 <54D8ADD9.4030506@free-electrons.com>
Date: Sat, 14 Feb 2015 22:45:28 +0100
In-Reply-To: <54D8ADD9.4030506@free-electrons.com> (Ezequiel Garcia's message
 of "Mon, 09 Feb 2015 09:53:45 -0300")
Message-ID: <874mqob213.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

> On 02/08/2015 05:02 PM, Robert Jarzmik wrote:
>> As the devicetree binding doesn't require num_cs to exist or be strictly
>> positive, and neither does the platform data case, a bug appear when
>> num_cs is set to 0 and panics the kernel.
...
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Looks good,
>
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Brian, David, would queue that up in your for-next tree please ?

Cheers.

-- 
Robert
