Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmPtS-0002T9-W3
 for linux-mtd@lists.infradead.org; Sun, 15 Jan 2012 13:13:08 +0000
Received: by eekb15 with SMTP id b15so65553eek.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jan 2012 05:13:05 -0800 (PST)
Subject: Re: [PATCH] UBI: Handle empty string in verify_mkvol_req()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sun, 15 Jan 2012 15:13:00 +0200
In-Reply-To: <1326463660-17852-1-git-send-email-richard@nod.at>
References: <1326463660-17852-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326633184.2201.9.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-01-13 at 15:07 +0100, Richard Weinberger wrote:
> Currently it's possible to create a volume without a name.
> E.g:
> ubimkvol -n 32 -s 2MiB -t static /dev/ubi0 -N ""
> 
> After that vtbl_check() will always fail because it does not permit
> empty strings.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Well-spotted, thank you! I'll send it to Linus soon, as well as the
other patch of yours.

Artem.
