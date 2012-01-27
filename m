Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rqqup-0000vr-Tf
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 18:52:52 +0000
Received: by wico1 with SMTP id o1so1962358wic.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 10:52:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1327684589.12089.22.camel@joe2Laptop>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
 <1327674295-3700-2-git-send-email-akinobu.mita@gmail.com>
 <1327684589.12089.22.camel@joe2Laptop>
Date: Fri, 27 Jan 2012 10:52:49 -0800
Message-ID: <CAN8TOE8Hq8f3ipQFxBAHXK5ArSH6wNc8GA5CbYr_xORBa5gAWw@mail.gmail.com>
Subject: Re: [PATCH] mtd/nand: use string library
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Scott Branden <sbranden@broadcom.com>,
 Akinobu Mita <akinobu.mita@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jiandong Zheng <jdzheng@broadcom.com>,
 akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 27, 2012 at 9:16 AM, Joe Perches <joe@perches.com> wrote:
> On Fri, 2012-01-27 at 23:24 +0900, Akinobu Mita wrote:
>> - Use memchr_inv to check if the data contains all 0xFF bytes.
>> =A0 It is faster than looping for each byte.
>
> Stupid question:
>
> Are there any mtd devices modified that are slower
> at 64 bit accesses than repeated 8 bit accesses?

I believe this patch deals with kernel buffers, not any kind of direct
access to the MTD, so the question (which is not stupid IMO) should be
regarding CPU architectures. And my educated guess is that 64-bit
access should not be any slower. I do know that 8-bit access *is*
slower for some relevant architectures.

Brian
