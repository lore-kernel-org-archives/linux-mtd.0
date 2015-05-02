Received: from mail-vn0-x234.google.com ([2607:f8b0:400c:c0f::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoZnb-0002Fw-0V
 for linux-mtd@lists.infradead.org; Sat, 02 May 2015 15:57:51 +0000
Received: by vnbg62 with SMTP id g62so12080101vnb.7
 for <linux-mtd@lists.infradead.org>; Sat, 02 May 2015 08:57:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1430579413-4820-1-git-send-email-xerofoify@gmail.com>
References: <1430579413-4820-1-git-send-email-xerofoify@gmail.com>
Date: Sat, 2 May 2015 17:57:28 +0200
Message-ID: <CAFLxGvzXWXgey+KyVdVy0FvUvzva1zn3jZTnTyqoOS3p94ExGQ@mail.gmail.com>
Subject: Re: [PATCH] mtd:Remove unnessary BUG function calls in nand_scan_tail
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Nicholas Krause <xerofoify@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: boris.brezillon@free-electrons.com, Baruch Siach <baruch@tkos.co.il>,
 kdasu.kdev@gmail.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 bpqw@micron.com, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, asierra@xes-inc.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, rogerq@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 2, 2015 at 5:10 PM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This removes all unnessary calls to BUG() below pr_warn print messages
> as these printed messages are verbose enough for debugging if these
> scenarios are hit in the function,nand_scan_tail.

NAK.
We cannot continue with a bad ECC mode.

-- 
Thanks,
//richard
