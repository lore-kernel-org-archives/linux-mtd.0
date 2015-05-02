Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoaOz-00085z-5G
 for linux-mtd@lists.infradead.org; Sat, 02 May 2015 16:36:30 +0000
Received: by iedfl3 with SMTP id fl3so120412171ied.1
 for <linux-mtd@lists.infradead.org>; Sat, 02 May 2015 09:36:07 -0700 (PDT)
In-Reply-To: <CAFLxGvzXWXgey+KyVdVy0FvUvzva1zn3jZTnTyqoOS3p94ExGQ@mail.gmail.com>
References: <1430579413-4820-1-git-send-email-xerofoify@gmail.com>
 <CAFLxGvzXWXgey+KyVdVy0FvUvzva1zn3jZTnTyqoOS3p94ExGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [PATCH] mtd:Remove unnessary BUG function calls in nand_scan_tail
From: Nicholas Krause <xerofoify@gmail.com>
Date: Sat, 02 May 2015 12:36:08 -0400
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <9C08D0D3-29D3-46E5-9207-E620241A94AA@gmail.com>
Cc: boris.brezillon@free-electrons.com, Baruch Siach <baruch@tkos.co.il>,
 kdasu.kdev@gmail.com, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
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



On May 2, 2015 11:57:28 AM EDT, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>On Sat, May 2, 2015 at 5:10 PM, Nicholas Krause <xerofoify@gmail.com>
>wrote:
>> This removes all unnessary calls to BUG() below pr_warn print
>messages
>> as these printed messages are verbose enough for debugging if these
>> scenarios are hit in the function,nand_scan_tail.
>
>NAK.
>We cannot continue with a bad ECC mode.
That makes sense, clearly you are correct here. 
Nick
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
