Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cfnZr-0002AV-8o
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2017 13:00:28 +0000
Subject: Re: [PATCH 0/2] mtd-utils: Fix printf format specifier for off_t and
 loff_t
To: torfl@t-online.de, linux-mtd@lists.infradead.org
References: <1486831412-30409-1-git-send-email-torfl@t-online.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <f1b8dc3b-8eed-308c-4aa3-e19fe5eb89c9@sigma-star.at>
Date: Mon, 20 Feb 2017 14:00:01 +0100
MIME-Version: 1.0
In-Reply-To: <1486831412-30409-1-git-send-email-torfl@t-online.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sorry for the delay, I just got around to testing this on a 32 bit
system today.

The patches look okay, but I wanted to at least try to reproduce
the warnings that the patch fixes.

I'm a bit cautious here, as this particular piece of code has been
patched repeatedly for this exact reason. Should there be further
problems, I guess at some point it would be easier to just remove
the macros and cast the printf arguments.


Applied to mtd-utils.git


Thanks,

David
